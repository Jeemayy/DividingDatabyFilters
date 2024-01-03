#############################################################################

install.packages("tidyverse")
library(tidyverse)
library(dplyr)

maja = Jabar9_Mj
View(maja)

library(dplyr)
library(pander)
library(kableExtra)

# Mendapatkan nilai unik pada kolom "kel" dan "not_tps"
tps <- unique(maja$no_tps)
kel <- unique(maja$kel)

########################################

# Ganti "nilai_tps" dan "nilai_kel" 
nilai_tps <- 20
nilai_kel <- "WARINGIN"

# Mengambil data berdasarkan nilai pada kolom "no_tps" dan "kel"
subset_data <- maja %>%
  filter(no_tps == nilai_tps, kel == nilai_kel)

# Menampilkan hasil subset data
View(subset_data)

########################################
# List column names
column_names <- names(maja)
print(column_names)

# Mendapatkan nilai unik dari kolom "no_tps" dan "kel"
unique_no_tps <- unique(maja$no_tps)
unique_kel <- unique(maja$kel)

# Looping daru kombinasi filter unik no_tps dan kel
for (tps in unique_no_tps) {
  for (kel_value in unique_kel) {
    # Mengganti nilai no_tps dan kel
    nilai_tps <- tps
    nilai_kel <- kel_value
    
    # Memotong baris data berdasarkan nilai pada kolom "no_tps" dan "kel"
    subset_data <- maja %>%
      filter(no_tps == nilai_tps, kel == nilai_kel)
    
    print(subset_data)
  }
}

#########################################
# Import Library dan Baca file dari .RData
install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(pander)
library(kableExtra)

load("C:/Users/Acer/Downloads/Documents/Jabar9_Majalengka.RData")
maja = Jabar9_Mj
View(maja)

load("C:/Users/Acer/Downloads/Documents/Jabar9_Sumedang.RData")
sum = Jabar9_Sm
View(sum)

sub = Jabar9_Sb
View(sub)
###################### Simpan hasil pemisahan dalam bentuk csv ######################
# Pilih folder untuk menyimpan file hasil pemisahan

load("C:/Users/Acer/Downloads/Documents/Jabar9_Sumedang.RData")

maja = Jabar9_Mj
# Menghapus kolom tempat_lahir, difabel, pro, dan kab
maja <- maja[, !(names(maja) %in% c("tempat_lahir", "difabel", "pro", "kab"))]
# Mengubah nama kolom
colnames(maja) <- gsub("_", " ", tolower(colnames(maja)))
View(maja)

path <- choose.dir()

# Memastikan bahwa path tidak kosong dan melanjutkan proses
if (nzchar(path)) {
  # Mendapatkan nilai unik dari kolom "no_tps" dan "kel"
  unique_no_tps <- unique(maja$`no tps`)
  unique_kel <- unique(maja$kel)
  
  # Melakukan loop untuk setiap kombinasi no_tps dan kel
  for (tps in unique_no_tps) {
    for (kel_value in unique_kel) {
      # Mengganti nilai no_tps dan kel
      nilai_tps <- tps
      nilai_kel <- kel_value
      
      # Memotong baris data berdasarkan nilai pada kolom "no_tps" dan "kel"
      subset_data <- maja %>%
        filter(`no tps` == nilai_tps, kel == nilai_kel)
      
      # Menyusun nama file berdasarkan kombinasi kab, kec, kel, dan no_tps
      nama_file <- paste0(subset_data$kec[1], "_", subset_data$kel[1], "_", nilai_tps, ".csv")
      
      # Buat path
      full_path <- file.path(path, nama_file)
      
      # Memeriksa apakah subset_data tidak kosong sebelum menyimpan ke CSV
      if (nrow(subset_data) > 0) {
        # Menyimpan subset data ke CSV
        write.csv(subset_data, file = full_path, row.names = FALSE)
      } else {
        print(paste("Subset data kosong untuk", nilai_tps, "-", nilai_kel, ". Data dibuang."))
      }
    }
  }
} else {
  print("Pilih folder penyimpanan.")
}

########################## Simpan Hasil Pemisahan dalam Bentuk Excel #################################
library(tidyverse)
library(openxlsx)

# Pilih folder untuk menyimpan file hasil pemisahan
path <- choose.dir()

sum[] <- lapply(sum, function(x) iconv(x, "UTF-8", "UTF-8", sub = ""))

# Replace non-UTF-8 characters with a placeholder
sum[] <- lapply(sum, function(x) iconv(x, "UTF-8", "UTF-8", sub = "", to = "ASCII//TRANSLIT"))

# Or you can remove non-UTF-8 characters
sum[] <- lapply(sum, function(x) iconv(x, "UTF-8", "UTF-8", sub = ""))


# Pilih folder penyimpanan
path <- choose.dir()

# Memastikan bahwa path tidak kosong supaya looping berjalan
if (nzchar(path)) {
  # Mendapatkan nilai unik dari kolom "no_tps" dan "kel"
  unique_no_tps <- unique(sum$no_tps)
  unique_kel <- unique(sum$kel)
  
  # Melakukan looping untuk setiap pilihan dari no_tps dan kel berdsasrkan nilai uniknya
  for (tps in unique_no_tps) {
    for (kel_value in unique_kel) {
      # Mengganti nilai no_tps dan kel
      nilai_tps <- tps
      nilai_kel <- kel_value
      
      # Memotong baris data berdasarkan nilai pada kolom "no_tps" dan "kel"
      subset_data <- sum %>%
        filter(no_tps == nilai_tps, kel == nilai_kel)
      
      # Menyusun nama file berdasarkan kombinasi no_tps dan kel
      nama_file <- paste0("subset_", nilai_tps, "_", nilai_kel, ".xlsx")
      
      # Buat File Path
      full_path <- file.path(path, nama_file)
      
      # Simpan subset ke excel
      write.xlsx(subset_data, file = full_path, row.names = FALSE)
    }
  }
} else {
  print("Pilih folder penyimpanan.")
}

###########################################################################
# Pilih folder untuk menyimpan file hasil pemisahan
path <- choose.dir()

# Memastikan bahwa path tidak kosong dan melanjutkan proses
if (nzchar(path)) {
  # Mendapatkan nilai unik dari kolom "no_tps" dan "kel"
  unique_no_tps <- unique(sum$no_tps)
  unique_kel <- unique(sum$kel)
  
  # Melakukan loop untuk setiap kombinasi no_tps dan kel
  for (tps in unique_no_tps) {
    for (kel_value in unique_kel) {
      # Mengganti nilai no_tps dan kel
      nilai_tps <- tps
      nilai_kel <- kel_value
      
      # Memotong baris data berdasarkan nilai pada kolom "no_tps" dan "kel"
      subset_data <- sum %>%
        filter(no_tps == nilai_tps, kel == nilai_kel)
      
      # Menyusun nama file berdasarkan kombinasi no_tps dan kel
      nama_file <- paste0("subset_", nilai_tps, "_", nilai_kel, ".csv")
      
      # Buat path
      full_path <- file.path(path, nama_file)
      
      # Memeriksa apakah subset_data tidak kosong sebelum menyimpan ke CSV
      if (nrow(subset_data) > 0) {
        # Menyimpan subset data ke CSV
        write.csv(subset_data, file = full_path, row.names = FALSE)
      } else {
        print(paste("Subset data kosong untuk", nilai_tps, "-", nilai_kel, ". Data dibuang."))
      }
    }
  }
} else {
  print("Pilih folder penyimpanan.")
}


############################ CEK Jumlah Data ##############################

# Mengecek jumlah data dari setiap file yang dipisahkan
total_data <- 0
for (tps in unique_no_tps) {
  for (kel_value in unique_kel) {
    # Menyusun nama file berdasarkan kombinasi no_tps dan kel
    nama_file <- paste0("subset_", tps, "_", kel_value, ".csv")
    
    # Buat path
    full_path <- file.path(path, nama_file)
    
    # Menampilkan full path untuk debugging
    print(paste("Full path:", full_path))
    
    # Mengecek apakah file ada
    if (file.exists(full_path)) {
      # Membaca data dari file CSV
      subset_data <- read.csv(full_path)
      
      # Mengecek jumlah data
      jumlah_data <- nrow(subset_data)
      
      # Menampilkan informasi jumlah data
      print(paste("Jumlah data untuk", tps, "-", kel_value, "adalah", jumlah_data))
      
      # Menambahkan jumlah data ke total_data
      total_data <- total_data + jumlah_data
    } else {
      print(paste("File tidak ditemukan:", full_path))
    }
  }
}

# Menampilkan total keseluruhan data
print(paste("Total keseluruhan data adalah", total_data))
