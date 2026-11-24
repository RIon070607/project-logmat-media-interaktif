Contoh II.5
Soal: Peserta pelatihan dinyatakan memenuhi syarat apabila memperoleh nilai ujian sekurang-kurangnya 70 dan kehadiran paling sedikit 80%. Nyatakan aturan tersebut dalam simbol logika, kemudian susun fungsi bahasa Pascal dan uji dengan beberapa pasangan nilai.
Pembahasan: Misalkan p: “Nilai ujian ≥ 70” dan q: “Kehadiran ≥ 80%”. Aturan kelayakan dinyatakan dengan p ∧ q. Dalam Pascal, operator konjungsi dituliskan sebagai AND.
program CekKelayakan;
uses crt;

function cek_peserta(skor, hadir: real): boolean;
var
  syaratNilai, syaratHadir: boolean;
begin
  syaratNilai := skor >= 70;
  syaratHadir := hadir >= 80;
  cek_peserta := syaratNilai and syaratHadir;
end;

begin
  clrscr;
  writeln('PROGRAM PEMERIKSAAN KELAYAKAN PESERTA');
  writeln('=====================================');
  writeln;
  writeln('75 85 -> ', cek_peserta(75, 85));
  writeln('90 70 -> ', cek_peserta(90, 70));
  writeln('65 95 -> ', cek_peserta(65, 95));
  writeln('50 60 -> ', cek_peserta(50, 60));
  writeln;
  readln;
end.
Keluaran program:
PROGRAM PEMERIKSAAN KELAYAKAN PESERTA
=====================================
75 85 -> TRUE
90 70 -> FALSE
65 95 -> FALSE
50 60 -> FALSE
Kesimpulan: Hanya pasangan skor dan kehadiran (75, 85) yang memenuhi kedua ketentuan. Hasil ini sesuai dengan sifat konjungsi (AND), yaitu bernilai benar apabila kedua proposisi bernilai benar. Jika salah satu atau keduanya salah, hasil konjungsi juga salah.
