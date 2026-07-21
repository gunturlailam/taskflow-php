CREATE DATABASE IF NOT EXISTS taskflow;
USE taskflow;

-- Tabel pengguna (sebelumnya users)
CREATE TABLE pengguna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    dibuat_pada TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel kategori
CREATE TABLE kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL
);

-- Tabel tugas
CREATE TABLE tugas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pengguna _id INT NOT NULL,
    kategori_id INT,
    judul VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    
    status ENUM('Belum', 'Proses', 'Selesai') DEFAULT 'Belum',
    prioritas ENUM('Rendah', 'Sedang', 'Tinggi') DEFAULT 'Sedang',
    dibuat_pada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    diperbarui_pada TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (pengguna_id) REFERENCES pengguna(id) ON DELETE CASCADE,
    FOREIGN KEY (kategori_id) REFERENCES kategori(id) ON DELETE SET NULL
);

-- Data awal kategori
INSERT INTO kategori (nama) VALUES ('Pribadi'), ('Pekerjaan'), ('Belajar');