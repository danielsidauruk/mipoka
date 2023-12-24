import express from 'express';
import { TemplateHandler } from 'easy-template-x';
import axios from 'axios';
import mime from 'mime-types';
import Jimp from 'jimp';
import imageSize from 'image-size';
import { Storage } from '@google-cloud/storage';
import libre from 'libreoffice-convert';

function convertMonthToWord(monthNumber) {
  switch (monthNumber) {
    case 1:
      return "Januari";
    case 2:
      return "Februari";
    case 3:
      return "Maret";
    case 4:
      return "April";
    case 5:
      return "Mei";
    case 6:
      return "Juni";
    case 7:
      return "Juli";
    case 8:
      return "Agustus";
    case 9:
      return "September";
    case 10:
      return "Oktober";
    case 11:
      return "November";
    case 12:
      return "Desember";
    default:
      return "Bulan tidak valid";
  }
}

function formatDateToIndonesian(dateString) {
  if (dateString) {
    const [day, month, year] = dateString.split('-');
    const monthNumber = parseInt(month, 10);
    const monthWord = convertMonthToWord(monthNumber);
    return `${day} ${monthWord} ${year}`;
  } else {
    return "Tanggal tidak tersedia";
  }
}

async function convertImageToPNG(imageURL) {
  try {
    const imageResponse = await axios.get(imageURL, {
      responseType: 'arraybuffer',
    });
    const imageBuffer = Buffer.from(imageResponse.data);
    const image = await Jimp.read(imageBuffer);
    const pngBuffer = await image.getBufferAsync(Jimp.MIME_PNG);
    return pngBuffer;
  } catch (error) {
    console.error('Terjadi kesalahan dalam mengonversi gambar:', error);
    return null;
  }
}

async function getImageDimensions(imageURL) {
  try {
    const response = await axios.get(imageURL, { responseType: 'arraybuffer' });
    const buffer = Buffer.from(response.data);
    const dimensions = imageSize(buffer);

    return {
      width: dimensions.width,
      height: dimensions.height,
    };
  } catch (error) {
    console.error('Terjadi kesalahan dalam mengambil dimensi gambar:', error);
    console.log(`Image Url Type : ${imageURL._type}`);
    return null;
  }
}

async function getImageSize(imageUrl, num = 600) {
  const dimensions = await getImageDimensions(imageUrl);
  let width = dimensions.width;
  let height = dimensions.height;

  if (width > num) {
    width = num;
    const widthRatio = width / dimensions.width;
    height *= widthRatio;
  }

  return { width, height };
}

async function getLogoSize(imageUrl, num = 300) {
  const dimensions = await getImageDimensions(imageUrl);
  let width = dimensions.width;
  let height = dimensions.height;

  if (height > num) {
    height = num;
    const heightRatio = height / dimensions.height;
    width *= heightRatio;
  }

  return { width, height };
}

async function fetchTemplateFile(templateUrl) {
  try {
    const response = await axios.get(templateUrl, {
      responseType: 'arraybuffer',
    });
    return Buffer.from(response.data);
  } catch (error) {
    console.error('Terjadi kesalahan dalam mengambil file template:', error);
    return null;
  }
}

const usulan_kegiatan_template_LK_url = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Fusulan_kegiatan%20(LK).docx?alt=media&token=568c6748-92e2-4ade-abb8-a045813dbe54";
const usulan_kegiatan_template_DK_url = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Fusulan_kegiatan%20(DL).docx?alt=media&token=6f857394-59b5-44fa-b6aa-0aa328bcf731";

const laporan_kegiatan_template_url = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Flaporan_template.docx?alt=media&token=d4993ba2-5bf2-4f77-ac0c-0d82750bb1cf";
const laporan_kegiatan_no_peserta_template_url = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Flaporan_template_no_peserta.docx?alt=media&token=211aac7f-f94c-40f9-99d6-67091c762f54";

const session_template_url = "https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Fsession_template.docx?alt=media&token=d3afc2c6-865d-4020-bd3a-e762f608e913";

const storage = new Storage({
  keyFilename: 'service_key/mipoka_service_account.json',
  projectId: 'mipoka',
});

const min = 1;
const max = 100;

async function uploadFileToBucket(bucketName, doc, options, fileName) {
  const bucket = storage.bucket(bucketName);
  const file = bucket.file(fileName);

  const fileOptions = {
    metadata: {
      contentType: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    },
  };

  const stream = file.createWriteStream({
    ...fileOptions,
    ...options,
  });

  return new Promise((resolve, reject) => {
    stream.on('error', (error) => {
      console.error('Terjadi kesalahan dalam mengupload file:', error);
      reject(error);
    });

    stream.on('finish', () => {
      const fileUrl = `https://storage.googleapis.com/${bucketName}/${fileName}`;
      resolve(fileUrl);
    });

    stream.end(doc);
  });
}

const options = {
  maxXmlDepth: Infinity
};

const bucketName = 'mipoka.appspot.com';

const handler = new TemplateHandler(options);

const app = express();
const port = 3000;

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.use(express.json());

app.post('/usulan-kegiatan', async (req, res) => {
  try {
    const usulan_kegiatan_data = req.body;

    const logo_ormawa_url = await getLogoSize(usulan_kegiatan_data.ormawa.logo_ormawa, 188);    
    const namaPembina = usulan_kegiatan_data.revisi_usulan?.user?.nama_lengkap;

    let foto_postingan_url;
    let foto_surat_undangan_url;
    let foto_linimasa_url;
    let foto_tempat_url;

    if (usulan_kegiatan_data.foto_postingan_kegiatan !== "") {
      foto_postingan_url = await getImageSize(usulan_kegiatan_data.foto_postingan_kegiatan);
    } 

    if (usulan_kegiatan_data.foto_surat_undangan_kegiatan !== "") {
      foto_surat_undangan_url = await getImageSize(usulan_kegiatan_data.foto_surat_undangan_kegiatan);
    }

    if (usulan_kegiatan_data.foto_linimasa_kegiatan !== "") {
      foto_linimasa_url = await getImageSize(usulan_kegiatan_data.foto_linimasa_kegiatan);
    }

    if (usulan_kegiatan_data.foto_tempat_kegiatan !== "") {
      foto_tempat_url = await getImageSize(usulan_kegiatan_data.foto_tempat_kegiatan);
    }

    const data = {
      nama_ormawa: usulan_kegiatan_data.ormawa.nama_ormawa,
      logo_ormawa: {
        _type: 'image',
        source: await convertImageToPNG(usulan_kegiatan_data.ormawa.logo_ormawa),
        format: mime.lookup('.png'),
        width: logo_ormawa_url.width,
        height: logo_ormawa_url.height,
      },
      nama_pengusul: usulan_kegiatan_data.user.nama_lengkap,
      pembina: namaPembina ?? "Pembina",
      ketua: usulan_kegiatan_data.ormawa.ketua,
      pembiayaan: usulan_kegiatan_data.pembiayaan,
      nama_kegiatan: usulan_kegiatan_data.nama_kegiatan,
      bentuk_kegiatan: usulan_kegiatan_data.bentuk_kegiatan,
      kategori_bentuk_kegiatan: usulan_kegiatan_data.kategori_bentuk_kegiatan,
      deskripsi_kegiatan: usulan_kegiatan_data.deskripsi_kegiatan,
      tanggal_mulai_kegiatan: formatDateToIndonesian(usulan_kegiatan_data.tanggal_mulai_kegiatan),
      tanggal_selesai_kegiatan: formatDateToIndonesian(usulan_kegiatan_data.tanggal_mulai_kegiatan),
      waktu_mulai_kegiatan: usulan_kegiatan_data.waktu_mulai_kegiatan,
      waktu_selesai_kegiatan: usulan_kegiatan_data.waktu_selesai_kegiatan,
      tempat_kegiatan: usulan_kegiatan_data.tempat_kegiatan,
      tanggal_keberangkatan: formatDateToIndonesian(usulan_kegiatan_data.tanggal_keberangkatan),
      tanggal_kepulangan: formatDateToIndonesian(usulan_kegiatan_data.tanggal_kepulangan),
      jumlah_partisipan: usulan_kegiatan_data.jumlah_partisipan,
      kategori_jumlah_partisipan: usulan_kegiatan_data.kategori_jumlah_partisipan,
      target_kegiatan: usulan_kegiatan_data.target_kegiatan,
      total_pendanaan: usulan_kegiatan_data.total_pendanaan,
      kategori_total_pendanaan: usulan_kegiatan_data.kategori_total_pendanaan,
      keterangan: usulan_kegiatan_data.keterangan,
      tanda_tangan_ormawa: {
          _type: 'image',
          source: await convertImageToPNG(usulan_kegiatan_data.tanda_tangan_ormawa),
          format: mime.lookup('.png'),
          width: 150,
          height: 100,
        },
      partisipan: usulan_kegiatan_data.partisipan.map((partisipan, index) => ({
          no: index + 1,
          no_induk: partisipan.no_induk,
          nama_partisipan: partisipan.nama_partisipan,
          nik: partisipan.nik,
          tempat_lahir: partisipan.tempat_lahir,
          tgl_lahir: partisipan.tgl_lahir,
          peran_partisipan: partisipan.peran_partisipan,
          dasar_pengiriman: partisipan.dasar_pengiriman,
      })),
      biaya_kegiatan: usulan_kegiatan_data.biaya_kegiatan.map((biaya_kegiatan, index) => ({
          no: index + 1,
          nama_biaya_kegiatan: biaya_kegiatan.nama_biaya_kegiatan,
          kuantiti: biaya_kegiatan.kuantiti,
          harga_satuan: biaya_kegiatan.harga_satuan,
          total: biaya_kegiatan.total,
          keterangan: biaya_kegiatan.keterangan,
      })),
      total_biaya: usulan_kegiatan_data.total_biaya,
      latar_belakang: usulan_kegiatan_data.latar_belakang,
      tujuan_kegiatan: usulan_kegiatan_data.tujuan_kegiatan,
      manfaat_kegiatan: usulan_kegiatan_data.manfaat_kegiatan,
      bentuk_pelaksanaan_kegiatan: usulan_kegiatan_data.bentuk_pelaksanaan_kegiatan,
      target_pencapaian_kegiatan: usulan_kegiatan_data.target_pencapaian_kegiatan,
      waktu_dan_tempat_pelaksanaan: usulan_kegiatan_data.waktu_dan_tempat_pelaksanaan,
      rencana_anggaran_kegiatan: usulan_kegiatan_data.rencana_anggaran_kegiatan,
      tertib_acara: usulan_kegiatan_data.tertib_acara.map((tertib_acara, index) => ({
          waktu_mulai_kegiatan: tertib_acara.waktu_mulai_kegiatan,
          waktu_selesai_kegiatan: tertib_acara.waktu_selesai_kegiatan,
          aktivitas: tertib_acara.aktivitas,
          keterangan: tertib_acara.keterangan,
          no: index + 1,
      })),
      perlengkapan_dan_peralatan: usulan_kegiatan_data.perlengkapan_dan_peralatan,
      penutup: usulan_kegiatan_data.penutup,
      foto_postingan_kegiatan: usulan_kegiatan_data.foto_postingan_kegiatan !== "" ? 
      {
          _type: 'image',
          source: await convertImageToPNG(usulan_kegiatan_data.foto_postingan_kegiatan),
          format: mime.lookup('.png'),
          width: foto_postingan_url.width,
          height: foto_postingan_url.height,
      } : 
      "-",
      
      foto_surat_undangan_kegiatan: usulan_kegiatan_data.foto_surat_undangan_kegiatan !== "" ? 
      {
        _type: 'image',
        source: await convertImageToPNG(usulan_kegiatan_data.foto_surat_undangan_kegiatan),
        format: mime.lookup('.png'),
        width: foto_surat_undangan_url.width,
        height: foto_surat_undangan_url.height,
      } :
      "-",
      foto_linimasa_kegiatan: usulan_kegiatan_data.foto_linimasa_kegiatan !== "" ?
      {
        _type: 'image',
        source: await convertImageToPNG(usulan_kegiatan_data.foto_linimasa_kegiatan),
        format: mime.lookup('.png'),
        width: foto_linimasa_url.width,
        height: foto_linimasa_url.height,
      } : 
      "-",
      foto_tempat_kegiatan: usulan_kegiatan_data.foto_tempat_kegiatan !== "" ?
      {
        _type: 'image',
        source: await convertImageToPNG(usulan_kegiatan_data.foto_tempat_kegiatan),
        format: mime.lookup('.png'),
        width: foto_tempat_url.width,
        height: foto_tempat_url.height,
      } : 
      "-",
      validasi_pembina: usulan_kegiatan_data.validasi_pembina,
      tanda_tangan_pembina: {
        _type: 'image',
          source: await convertImageToPNG(usulan_kegiatan_data.tanda_tangan_pembina),
          format: mime.lookup('.png'),
          width: 150,
          height: 100,
      },
      tahun: new Date().getFullYear(),
      tanggal: formatDateToIndonesian(usulan_kegiatan_data.updated_at),
    };
  
    let doc;
    if (usulan_kegiatan_data.tanggal_keberangkatan !== "-") {
      doc = await handler.process(await fetchTemplateFile(usulan_kegiatan_template_LK_url), data);
    } else {
      doc = await handler.process(await fetchTemplateFile(usulan_kegiatan_template_DK_url), data);
    }

    const uploadOptions = {}

    if (usulan_kegiatan_data.tanda_tangan_pembina === "") {

      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `Usulan Kegiatan ${usulan_kegiatan_data.nama_kegiatan} - ${usulan_kegiatan_data.tanggal_mulai_kegiatan} ${randomInteger}.docx`;

      uploadFileToBucket(bucketName, doc, uploadOptions, fileName)
      .then((fileUrl) => {
        console.log('URL file:', fileUrl);
        res.set('Content-Type', 'text/plain');
        res.send(fileUrl);
      }).catch((error) => {
        console.error('Terjadi kesalahan:', error);
        res.status(500).send(error);
      });

    } else {

      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `Usulan Kegiatan ${usulan_kegiatan_data.nama_kegiatan} - ${usulan_kegiatan_data.tanggal_mulai_kegiatan} ${randomInteger}.pdf`;
      
      try {
        const docxBuffer = Buffer.from(doc, 'binary');

        libre.convert(docxBuffer, '.pdf', undefined, (err, pdfBuffer) => {
          if (err) {
            console.error('Gagal mengonversi dokumen DOCX ke PDF:', err);
            return;
          }

          uploadFileToBucket(bucketName, pdfBuffer, uploadOptions, fileName)
          .then((fileUrl) => {
            console.log('URL file:', fileUrl);
            res.set('Content-Type', 'text/plain');
            res.send(fileUrl);
          }).catch((error) => {
            console.error('Terjadi kesalahan:', error);
            res.status(500).send(error);
          });
        });

      } catch (error) {
        console.error('Terjadi kesalahan:', error);
      }
    }

} catch (error) {
  console.error('Error processing template:', error);
  res.status(500).send('Error processing template');
}});


app.post('/laporan', async (req, res) => {
  try {
    const laporan_data = req.body;

    const logo_ormawa_url = await getLogoSize(laporan_data.usulan.ormawa.logo_ormawa, 188);
    const namaPembina = laporan_data.usulan?.user?.nama_lengkap;

    let foto_postingan_url;
    let foto_dokumentasi_url;
    let foto_tabulasi_hasil_url;
    let foto_faktur_pembayaran_url;

    if (laporan_data.foto_postingan_kegiatan !== "") {
      foto_postingan_url = await getImageSize(laporan_data.foto_postingan_kegiatan);
    } 

    if (laporan_data.foto_dokumentasi_kegiatan !== "") {
      foto_dokumentasi_url = await getImageSize(laporan_data.foto_dokumentasi_kegiatan);
    }

    if (laporan_data.foto_tabulasi_hasil !== "") {
      foto_tabulasi_hasil_url = await getImageSize(laporan_data.foto_tabulasi_hasil);
    }

    if (laporan_data.foto_faktur_pembayaran !== "") {
      foto_faktur_pembayaran_url = await getImageSize(laporan_data.foto_faktur_pembayaran);
    }

    const data = {
      nama_ormawa: laporan_data.usulan.ormawa.nama_ormawa,
      logo_ormawa: {
        _type: 'image',
        source: await convertImageToPNG(laporan_data.usulan.ormawa.logo_ormawa),
        format: mime.lookup('.png'),
        width: logo_ormawa_url.width,
        height: logo_ormawa_url.height,
      },
      nama_pelapor: laporan_data.usulan.user.nama_lengkap,
      pembina: namaPembina ?? "Pembina",
      pembiayaan: laporan_data.usulan.pembiayaan,
      nama_kegiatan: laporan_data.usulan.nama_kegiatan,
      bentuk_kegiatan: laporan_data.usulan.bentuk_kegiatan,
      kategori_bentuk_kegiatan: laporan_data.usulan.kategori_bentuk_kegiatan,
      deskripsi_kegiatan: laporan_data.usulan.deskripsi_kegiatan,
      tanggal_mulai_kegiatan: formatDateToIndonesian(laporan_data.usulan.tanggal_mulai_kegiatan),
      tanggal_selesai_kegiatan: formatDateToIndonesian(laporan_data.usulan.tanggal_mulai_kegiatan),
      waktu_mulai_kegiatan: laporan_data.usulan.waktu_mulai_kegiatan,
      waktu_selesai_kegiatan: laporan_data.usulan.waktu_selesai_kegiatan,
      tempat_kegiatan: laporan_data.usulan.tempat_kegiatan,
      tanggal_keberangkatan: formatDateToIndonesian(laporan_data.usulan.tanggal_keberangkatan),
      tanggal_kepulangan: formatDateToIndonesian(laporan_data.usulan.tanggal_kepulangan),
      jumlah_partisipan: laporan_data.usulan.jumlah_partisipan,
      kategori_jumlah_partisipan: laporan_data.usulan.kategori_jumlah_partisipan,
      target_kegiatan: laporan_data.usulan.target_kegiatan,
      total_pendanaan: laporan_data.usulan.total_pendanaan,
      kategori_total_pendanaan: laporan_data.usulan.kategori_total_pendanaan,
      keterangan: laporan_data.usulan.keterangan,
      tanda_tangan_ormawa: {
          _type: 'image',
          source: await convertImageToPNG(laporan_data.usulan.tanda_tangan_ormawa),
          format: mime.lookup('.png'),
          width: 150,
          height: 100,
        },
      latar_belakang: laporan_data.latar_belakang,
      bentuk_pelaksanaan_kegiatan: laporan_data.usulan.bentuk_pelaksanaan_kegiatan,
      hasil_kegiatan: laporan_data.hasil_kegiatan,
      waktu_dan_tempat_pelaksanaan: laporan_data.usulan.waktu_dan_tempat_pelaksanaan,
      rincian_biaya_kegiatan: laporan_data.rincian_biaya_kegiatan.map((rincian_biaya_kegiatan, index) => ({
        nama_biaya_kegiatan: rincian_biaya_kegiatan.nama_biaya,
        keterangan: rincian_biaya_kegiatan.keterangan,
        kuantiti: rincian_biaya_kegiatan.kuantitas,
        harga_satuan: rincian_biaya_kegiatan.harga_satuan,
        usulan_anggaran: rincian_biaya_kegiatan.usulan_anggaran,
        realisasi_anggaran: rincian_biaya_kegiatan.realisasi_anggaran,
        selisih: rincian_biaya_kegiatan.selisih,
        no: index + 1,
    })),

    partisipan: laporan_data.usulan.partisipan.map((partisipan, index) => ({
      no: index + 1,
      no_induk: partisipan.no_induk,
      nama_partisipan: partisipan.nama_partisipan,
      peran_partisipan: partisipan.peran_partisipan,
  })),

    peserta_kegiatan_laporan: laporan_data.peserta_kegiatan_laporan.map((peserta_kegiatan_laporan, index) => ({
      nim: peserta_kegiatan_laporan.nim,
      nama_lengkap: peserta_kegiatan_laporan.nama_lengkap,
      peran: peserta_kegiatan_laporan.peran,
      no: index + 1,
    })),

    total_selisih: laporan_data.total_selisih,
    penutup: laporan_data.penutup,

      foto_postingan_kegiatan: laporan_data.foto_postingan_kegiatan !== "" ? 
      {
          _type: 'image',
          source: await convertImageToPNG(laporan_data.foto_postingan_kegiatan),
          format: mime.lookup('.png'),
          width: foto_postingan_url.width,
          height: foto_postingan_url.height,
      } : 
      "-",
      
      foto_dokumentasi_kegiatan: laporan_data.foto_dokumentasi_kegiatan !== "" ? 
      {
        _type: 'image',
        source: await convertImageToPNG(laporan_data.foto_dokumentasi_kegiatan),
        format: mime.lookup('.png'),
        width: foto_dokumentasi_url.width,
        height: foto_dokumentasi_url.height,
      } :
      "-",
      foto_tabulasi_hasil: laporan_data.foto_tabulasi_hasil !== "" ?
      {
        _type: 'image',
        source: await convertImageToPNG(laporan_data.foto_tabulasi_hasil),
        format: mime.lookup('.png'),
        width: foto_tabulasi_hasil_url.width,
        height: foto_tabulasi_hasil_url.height,
      } : 
      "-",
      foto_faktur_pembayaran: laporan_data.foto_faktur_pembayaran !== "" ?
      {
        _type: 'image',
        source: await convertImageToPNG(laporan_data.foto_faktur_pembayaran),
        format: mime.lookup('.png'),
        width: foto_faktur_pembayaran_url.width,
        height: foto_faktur_pembayaran_url.height,
      } : 
      "-",
      tanda_tangan_pembina: laporan_data.validasi_pembina === "Disetujui" ? {
        _type: 'image',
          source: await convertImageToPNG(laporan_data.usulan.tanda_tangan_pembina),
          format: mime.lookup('.png'),
          width: 150,
          height: 100,
      } : 
      "-",
      validasi_pembina: laporan_data.validasi_pembina,
      tahun: new Date().getFullYear(),
      tanggal: formatDateToIndonesian(laporan_data.usulan.updated_at),
    }

    let doc;
    if (laporan_data.peserta_kegiatan_laporan.length === 0) {
      doc = await handler.process(await fetchTemplateFile(laporan_kegiatan_no_peserta_template_url), data);
    } else {
      doc = await handler.process(await fetchTemplateFile(laporan_kegiatan_template_url), data);
    }
  
    const uploadOptions = {}

    if(laporan_data.validasi_pembina === "Disetujui") {
      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `Laporan Kegiatan ${laporan_data.usulan.nama_kegiatan} - ${laporan_data.updated_at} ${randomInteger}.pdf`;

      try {
        const docxBuffer = Buffer.from(doc, 'binary');

        libre.convert(docxBuffer, '.pdf', undefined, (err, pdfBuffer) => {
          if (err) {
            console.error('Gagal mengonversi dokumen DOCX ke PDF:', err);
            return;
          }

          uploadFileToBucket(bucketName, pdfBuffer, uploadOptions, fileName)
          .then((fileUrl) => {
            console.log('URL file:', fileUrl);
            res.set('Content-Type', 'text/plain');
            res.send(fileUrl);
          }).catch((error) => {
            console.error('Terjadi kesalahan:', error);
            res.status(500).send(error);
          });
        });

      } catch (error) {
        console.error('Terjadi kesalahan:', error);
      }

    } else {
      
      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `Laporan Kegiatan ${laporan_data.usulan.nama_kegiatan} - ${laporan_data.updated_at} ${randomInteger}.docx`;

      uploadFileToBucket(bucketName, doc, uploadOptions, fileName)
      .then((fileUrl) => {
        console.log('URL Laporan :', fileUrl);
        res.set('Content-Type', 'text/plain');
        res.send(fileUrl);
      }).catch((error) => {
        console.error('Terjadi kesalahan:', error);
        res.status(500).send(error);
      });

    }

  } catch (error) {
    console.error('Error processing template:', error);
    res.status(500).send('Error processing template');
  }});


app.post('/session', async (req, res) => {
  try{
    const session_data = req.body;

    const data = {
      tanggal_mulai: formatDateToIndonesian(session_data.tanggal_mulai),
      tanggal_selesai: formatDateToIndonesian(session_data.tanggal_selesai),
      ruangan: session_data.ruangan,
      gedung: session_data.gedung,
      mulai: session_data.waktu_mulai_penggunaan,
      selesai: session_data.waktu_selesai_penggunaan,
      kegiatan: session_data.kegiatan,

      is_proyektor: session_data.proyektor !== 0,
      is_laptop: session_data.laptop !== 0,
      is_mikrofon: session_data.mikrofon !== 0,
      is_speaker: session_data.speaker !== 0,
      is_meja: session_data.meja !== 0,
      is_kursi: session_data.kursi !== 0,
      is_papan_tulis: session_data.papan_tulis !== 0,
      is_spidol: session_data.spidol !== 0,
      
      proyektor: session_data.proyektor,
      laptop: session_data.laptop,
      mikrofon: session_data.mikrofon,
      speaker: session_data.speaker,
      meja: session_data.meja,
      kursi: session_data.kursi,
      papan_tulis: session_data.papan_tulis,
      spidol: session_data.spidol,
      lain_lain: session_data.lain_lain,

      tanda_tangan_sa: {
        _type: 'image',
        source: await convertImageToPNG(session_data.tanda_tangan_sa),
        format: mime.lookup('.png'),
        width: 150,
        height: 100,
      },

      done: {
          _type: 'image',
          source: await convertImageToPNG("https://firebasestorage.googleapis.com/v0/b/mipoka.appspot.com/o/template-file%2Ficons8-done-26.png?alt=media&token=5fbb0328-ead3-4c02-bdb8-9e9757e37961"),
          format: mime.lookup('.png'),
          width: 20,
          height: 20,
      },
      
    };

    const doc = await handler.process(await fetchTemplateFile(session_template_url), data);

    const uploadOptions = {}

    if (session_data.tanda_tangan_sa === "" || session_data.tanda_tangan_sa === null) {
      
      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `${session_data.ormawa.nama_singkatan_ormawa} - Penggunaan Ruangan (${session_data.ruangan}) - (${session_data.tanggal_mulai}) ${randomInteger}.docx`;

      uploadFileToBucket(bucketName, doc, uploadOptions, fileName)
      .then((fileUrl) => {
        console.log('URL Laporan :', fileUrl);
        res.set('Content-Type', 'text/plain');
        res.send(fileUrl);
      }).catch((error) => {
        console.error('Terjadi kesalahan:', error);
        res.status(500).send(error);
      });
      
    } else {

      const randomInteger = Math.floor(Math.random() * (max - min + 1)) + min;
      const fileName = `${session_data.ormawa.nama_singkatan_ormawa} - Penggunaan Ruangan (${session_data.ruangan}) - (${session_data.tanggal_mulai}) ${randomInteger}.pdf`;

      try {
        const docxBuffer = Buffer.from(doc, 'binary');

        libre.convert(docxBuffer, '.pdf', undefined, (err, pdfBuffer) => {
          if (err) {
            console.error('Gagal mengonversi dokumen DOCX ke PDF:', err);
            return;
          }

          uploadFileToBucket(bucketName, pdfBuffer, uploadOptions, fileName)
          .then((fileUrl) => {
            console.log('URL file:', fileUrl);
            res.set('Content-Type', 'text/plain');
            res.send(fileUrl);
          }).catch((error) => {
            console.error('Terjadi kesalahan:', error);
            res.status(500).send(error);
          });
        });

      } catch (error) {
        console.error('Terjadi kesalahan:', error);
      }
    }


  } catch(error) {
    console.error('Error processing template:', error);
    res.status(500).send('Error processing template');
  }
});

  const server = app.listen(port, () => {
  server.keepAliveTimeout = 100000;
  console.log(`Server running on port ${port}`);
});