program LogikaProposisi;
{ Program ilustrasi Bab II: Logika Proposisi
  - Operator NOT, AND, OR, implikasi, biimplikasi
  - Tabel kebenaran gabungan
  - Studi Kasus II.1 (verifikasi akses) dan II.2 (sertifikasi)
  - Translasi kalimat ke simbol: (p AND q) -> r }

{ ===== Fungsi operator logika ===== }
function Negasi(p: boolean): boolean;
begin
  Negasi := not p;
end;

function Konjungsi(p, q: boolean): boolean;
begin
  Konjungsi := p and q;
end;

function Disjungsi(p, q: boolean): boolean;
begin
  Disjungsi := p or q;
end;

function Implikasi(p, q: boolean): boolean;
begin
  { p -> q salah hanya jika p benar dan q salah }
  Implikasi := (not p) or q;
end;

function Biimplikasi(p, q: boolean): boolean;
begin
  { p <-> q benar jika p dan q bernilai sama }
  Biimplikasi := (p = q);
end;

{ ===== Fungsi bantu ===== }
function NilaiBS(b: boolean): char;
begin
  if b then NilaiBS := 'B'
  else NilaiBS := 'S';
end;

function BacaYT(pesan: string): boolean;
var
  jawab: char;
begin
  repeat
    write(pesan, ' (y/t): ');
    readln(jawab);
    jawab := upcase(jawab);
    if (jawab <> 'Y') and (jawab <> 'T') then
      writeln('Masukan tidak valid. Ketik y atau t.');
  until (jawab = 'Y') or (jawab = 'T');
  BacaYT := (jawab = 'Y');
end;

function BacaInt(pesan: string; minimum, maksimum: integer): integer;
var
  x: integer;
begin
  repeat
    write(pesan, ' (', minimum, '-', maksimum, '): ');
    readln(x);
    if (x < minimum) or (x > maksimum) then
      writeln('Nilai di luar rentang. Ulangi.');
  until (x >= minimum) and (x <= maksimum);
  BacaInt := x;
end;

{ ===== Menu 1: tabel kebenaran gabungan ===== }
procedure TabelKebenaran;
var
  i: integer;
  p, q: boolean;
begin
  writeln;
  writeln('TABEL KEBENARAN GABUNGAN (B = benar, S = salah)');
  writeln('------------------------------------------------------');
  writeln(' p   q   ~p   p^q   pvq   p->q   p<->q');
  writeln('------------------------------------------------------');
  for i := 0 to 3 do
  begin
    p := (i < 2);          { baris: BB, BS, SB, SS }
    q := (i mod 2 = 0);
    writeln(' ', NilaiBS(p), '   ', NilaiBS(q), '   ',
            NilaiBS(Negasi(p)), '    ',
            NilaiBS(Konjungsi(p, q)), '     ',
            NilaiBS(Disjungsi(p, q)), '     ',
            NilaiBS(Implikasi(p, q)), '      ',
            NilaiBS(Biimplikasi(p, q)));
  end;
  writeln('------------------------------------------------------');
end;

{ ===== Menu 2: hitung operator dari masukan pengguna ===== }
procedure HitungOperator;
var
  p, q: boolean;
begin
  writeln;
  writeln('HITUNG OPERATOR LOGIKA');
  p := BacaYT('Nilai p benar?');
  q := BacaYT('Nilai q benar?');
  writeln;
  writeln('p = ', NilaiBS(p), ', q = ', NilaiBS(q));
  writeln('~p      = ', NilaiBS(Negasi(p)));
  writeln('~q      = ', NilaiBS(Negasi(q)));
  writeln('p ^ q   = ', NilaiBS(Konjungsi(p, q)));
  writeln('p v q   = ', NilaiBS(Disjungsi(p, q)));
  writeln('p -> q  = ', NilaiBS(Implikasi(p, q)));
  writeln('p <-> q = ', NilaiBS(Biimplikasi(p, q)));
end;

{ ===== Menu 3: Studi Kasus II.1 ===== }
procedure VerifikasiAkses;
var
  p, q: boolean;
begin
  writeln;
  writeln('STUDI KASUS II.1: VERIFIKASI AKSES ANGGOTA');
  writeln('p: identitas anggota tercatat');
  writeln('q: kode rahasia sesuai');
  p := BacaYT('Apakah identitas anggota tercatat?');
  q := BacaYT('Apakah kode rahasia sesuai?');
  writeln;
  writeln('p = ', NilaiBS(p), ', q = ', NilaiBS(q),
          ' -> p ^ q = ', NilaiBS(Konjungsi(p, q)));
  if Konjungsi(p, q) then
    writeln('Hasil: AKSES DIBERIKAN')
  else
    writeln('Hasil: AKSES DITOLAK');
end;

{ ===== Menu 4: Studi Kasus II.2 ===== }
procedure CekSertifikat;
var
  nilai, hadir: integer;
  p, q: boolean;
begin
  writeln;
  writeln('STUDI KASUS II.2: PEMERIKSAAN KETENTUAN SERTIFIKASI');
  writeln('p: nilai ujian minimal 70');
  writeln('q: kehadiran minimal 80%');
  nilai := BacaInt('Masukkan nilai ujian', 0, 100);
  hadir := BacaInt('Masukkan persentase kehadiran', 0, 100);
  p := (nilai >= 70);
  q := (hadir >= 80);
  writeln;
  writeln('p = ', NilaiBS(p), ', q = ', NilaiBS(q),
          ' -> p ^ q = ', NilaiBS(Konjungsi(p, q)));
  if Konjungsi(p, q) then
    writeln('Hasil: PESERTA BERHAK MEMPEROLEH SERTIFIKAT')
  else
    writeln('Hasil: PESERTA BELUM MEMENUHI KETENTUAN');
end;

{ ===== Menu 5: translasi kalimat ke simbol ===== }
procedure TranslasiKalimat;
var
  p, q, r, hasil: boolean;
begin
  writeln;
  writeln('TRANSLASI KALIMAT KE SIMBOL');
  writeln('Kalimat: "Jika kartu valid dan PIN tepat, maka transaksi dapat diproses."');
  writeln('p: kartu valid');
  writeln('q: PIN tepat');
  writeln('r: transaksi dapat diproses');
  writeln('Bentuk simbolik: (p ^ q) -> r');
  writeln;
  p := BacaYT('Apakah kartu valid?');
  q := BacaYT('Apakah PIN tepat?');
  r := BacaYT('Apakah transaksi diproses?');
  hasil := Implikasi(Konjungsi(p, q), r);
  writeln;
  writeln('p ^ q        = ', NilaiBS(Konjungsi(p, q)));
  writeln('(p ^ q) -> r = ', NilaiBS(hasil));
  if hasil then
    writeln('Pernyataan bernilai BENAR pada kondisi ini.')
  else
    writeln('Pernyataan bernilai SALAH pada kondisi ini.');
end;

{ ===== Program utama ===== }
var
  pilihan: integer;
begin
  repeat
    writeln;
    writeln('==============================================');
    writeln('        PROGRAM ILUSTRASI LOGIKA PROPOSISI');
    writeln('==============================================');
    writeln('1. Tabel kebenaran gabungan');
    writeln('2. Hitung operator (NOT, AND, OR, ->, <->)');
    writeln('3. Studi Kasus II.1: Verifikasi akses anggota');
    writeln('4. Studi Kasus II.2: Ketentuan sertifikasi');
    writeln('5. Translasi kalimat ke simbol');
    writeln('0. Keluar');
    pilihan := BacaInt('Pilih menu', 0, 5);

    case pilihan of
      1: TabelKebenaran;
      2: HitungOperator;
      3: VerifikasiAkses;
      4: CekSertifikat;
      5: TranslasiKalimat;
      0: writeln('Terima kasih.');
    end;
  until pilihan = 0;
end.
