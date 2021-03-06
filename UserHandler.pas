// Unit UserHandler digunakan untuk menjalankan
// command yang berhubungan dengan manajemen akun pengguna
unit UserHandler;

interface
	uses
		Util, Database;
	var
		loggedUser: User;
	procedure login;
	procedure register;
	procedure cari_anggota;

implementation
	// Prosedur login digunakan untuk mengakses program dengan memasukkan identitas dari user pengguna dan kata sandi guna mendapakan hak akses
	procedure login;
		var
			username, password: string;
			u: User;
		begin
			u := userNul;
			write('Masukkan username: ');
			readln(username);
			write('Masukkan password: ');
			readln(password);
			u := findUser(username);
			if isUserNull(u) or (u.password <> hashCode(password)) then
				writeln('Username / password salah! Silakan coba lagi.')
			else begin
				writeln('Selamat datang ', u.username, '!');
				loggedUser := u;
			end;
		end;

	// Prosedur register digunakan untuk mendaftarkan user pertama kali
	procedure register;
		var 
			password: string;
			res: User;
		begin
			write('Masukkan nama pengunjung: ');
			readln(res.nama);
			write('Masukkan alamat pengunjung: ');
			readln(res.alamat);
			write('Masukkan username pengunjung: ');
			readln(res.username);
			write('Masukkan password pengunjung: ');
			readln(password);
			res.password := hashCode(password);
			res.role := ROLE_PENGUNJUNG;
			addUser(res);
			writeln('Pengunjung ', res.nama, ' berhasil terdaftar sebagai user.');
		end;

	// Prosedur cari_anggota digunakan untuk mencari data diri dari anggota perpustakaan
	procedure cari_anggota;
		var
			s: string;
			u: User;
		begin
			u := userNul;
			write('Masukkan username: ');
			readln(s);
			u := findUser(s);
			if isUserNull(u) then
				writeln('User tidak ditemukan.')
			else begin
				writeln('Nama Anggota: ', u.nama);
				writeln('Alamat anggota: ', u.alamat);
			end;
		end;

end.