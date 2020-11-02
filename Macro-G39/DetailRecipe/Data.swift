//
//  Data.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 01/11/20.
//

import Foundation

enum jenisPisang {
    case Ambon
    case Uli
    case Tanduk
    case General
}

enum tingkatKematangan{
    case Mengkal
    case Matang
    case Kematengan
    case General
}

struct Resep {
    let jenisPisang: jenisPisang
    let tingkatKematangan: tingkatKematangan
    let namaRecipe: String
    let description: String
    let gambarRecipe: String
    let bahanRecipe: [String]
    let instruksiRecipe: [String]
    let source: String
}

let listResep = [
    Resep(jenisPisang: .Ambon, tingkatKematangan: .Matang, namaRecipe: "Banana Cheese Cake Lumer", description: "", gambarRecipe: "", bahanRecipe: [
            "3buah pisang ambon yang telah dipotong-potong",
            "100 gram keju",
            "1/2 bungkus biskuit regal yang sudah dihancurkan",
            "200 ml susu cair full cream",
            "2 sendok makan tepung maizena yang dilarutkan dengan sedikit air",
            "3 sendok makan gula pasir",
            "Sejumput garam"],
        instruksiRecipe: ["Didihkan susu cair, keju, gula pasir, dan garam. Aduk hingga larut. Tambahkan larutan tepung maizena, lalu aduk hingga rata. Masak hingga meletup-letup.",
            "Susun dalam wadah dengan urutan biskuit, potongan pisang, keju, lalu pisang. Kamu bisa menghiasnya sesuka hati",
            "Masukkan ke dalam kulkas dan sajikan ketika dingin"], source: ""),
    Resep(jenisPisang: .Ambon, tingkatKematangan: .Matang, namaRecipe: "Banana Pancake",description: "", gambarRecipe: "", bahanRecipe: [
            "1 buah pisang Ambon matang, kupas",
            "1 buah telur ayam",
            "Sedikit minyak goreng, margarin, atau mentega untuk mengoles wajan",
            "Pelengkap (opsional) : Madu, sirop maple, sirop cokelat, susu kental manis, atau bahan tuang lain sesuai selera. Taburan, misalnya butiran cokelat, meisjes, keju, buah, Ice Cream, dsb"],
        instruksiRecipe: ["Lumatkan pisang dalam mangkok dengan garpu",
            "Masukan telur ke dalam lumatan pisang, aduk hingga rata",
            "Beri sedikit minyak/mentega ke wajan agar tidak lengket", "Tuangkan sesendok adonan pisang ke wajan panas. Tunggu beberapa saat sampai bagian bawahnya tak lengket, lalu balikkan pancake. Setelah kedua sisi pancake berwarna cokelat, angkat.", "Pancake pisang siap disajikan dengan tambahan pelengkap sesuai selera"], source: ""),
    Resep(jenisPisang: .Ambon, tingkatKematangan: .Matang, namaRecipe: "Banana Cupcake",description: "", gambarRecipe: "", bahanRecipe: [
        "2 buah pisang ambon yang sudah dilumatkan", "150 gram gula pasir", "1 sendok makan emulsifier", "100 gram margarin yang dicarikan", "170 gram tepung terigu", "30 gr Maizena", "4 butir telurr", "1/2 sendok teh baking powder", "1/2 sendok teh bubuk kayu manis", "1/4 sendok teh garam"
    ], instruksiRecipe: [
        "Panaskan oven, lalu kocok dengan kecepatan tinggi adonan telur, gula, emulsifier, sampai mengembang kental.", "Turunkan kecepatan mixer, masukkan pisang bergantian dengan tepung terigu, maizena, baking powder, garam, kayu manis secara bertahap", "Matikan mixer lalu tuang margarin cair aduk lipat menggunakan spatula hingga rata. Pastikan tidak ada cairan di dasar adonan.", "Tuang adonan ke cup bolu kukus yang sudah dialasi kertas.", "Panggang selama 20 menit di oven.", "Tunggu sampai dingin lalu hias dengan irisan buah pisang dan butter cream."
    ], source: ""),
    Resep(jenisPisang: .Ambon, tingkatKematangan: .Kematengan, namaRecipe: "Banana Classic Butter Cake",description: "", gambarRecipe: "", bahanRecipe: [
        "1-2 buah Pisang Ambon/Raja, haluskan","1 butir Telur","85 gr Tepung Segitiga","45 gr Butter, lelehkan","40 gr Minyak Goreng","50 gr Gula Palem/Gula Pasir","1 sdt Rum (optional)","1/2 sdt Kayu Manis Bubuk","1/2 sdt Baking Powder","Secubit Garam","Secubit Vanili","Secukupnya Chocochips"
    ], instruksiRecipe: [
        "Campur bahan basah: Gula Palem + Telur + Pisang + Butter + Minyak Goreng + Garam + Vanili, aduk sampai rata.","Campur + ayak bahan kering: Tepung + Baking Powder + Kayu Manis Bubuk.","Campur bahan kering + bahan basah, aduk sampai rata, masukkan Chocochip, aduk rata."
    ], source: ""),
    Resep(jenisPisang: .Ambon, tingkatKematangan: .Kematengan, namaRecipe: "Banana Bread", description: "", gambarRecipe: "", bahanRecipe: [
        "1 dan 3/4 cup tepung terigu","1/3 cup gula pasir","1 sdt kayu manis bubuk","1 sdt baking powder","1/4 sdt baking soda","1/4 sdt garam","4 buah pisang","2 butir telur","1/2 cup minyak", "1 sdt ekstrak vanila"
    ], instruksiRecipe: [
        "Campur bahan kering jadi satu, sisihkan. Di mangkuk lain, haluskan pisang dengan garpu atau potato masher,campur rata dengan bahan basah lainnya.", "Tuangkan bahan basah ke mangkuk bahan kering, aduk secukupnya hingga rata. Jangan terlalu lama mengaduk, karena banana bread nanti bisa jadi bantat.", "Tuangkan ke loyang, kukus selama 50-60 menit atau hingga matang. Bisa juga dipanggang di oven selama 50-60 menit dengan suhu sekitar 180-200 derajat Celcius."
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Mengkal, namaRecipe: "Keripik Pisang", description: "", gambarRecipe: "", bahanRecipe: [
    "10 buah pisang mengkal, iris tipis", "Minyak goreng", "5 sdm air hangat", "3 sdm gula pasir", "1/4 sdt garam"
    ], instruksiRecipe: [
    "Buat bahan larutan yaitu air hangat, gula pasir dan garam. aduk rata dan sisihkan", "Goreng irisan pisang pada minyak panas dengan api kecil", "Setelah 1/2 matang, tuang 1 sdm larutan gula lalu aduk cepat dan tutup penggorengan", "Setelah suara minyak berkurang, buka tutup wajan lalu aduk rata hingga berubah warna, dan angkat kemudian tiriskan"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Mengkal, namaRecipe: "Pisang Goreng", description: "", gambarRecipe: "", bahanRecipe: [
        "1 sisir pisang dibelah 2", "150 gr tepung terigu", "2 sdm tepung beras", "3 sdm gula pasir", "1 sdt vanili", "sejumput garam", "secukupnya air", "minyak untuk menggoreng"
    ], instruksiRecipe: [
    "Campur tepung terigu, tepung beras, gula, vanili, garam","Aduk dan beri air hingga adonan mengental","Pisang yang telah dibelah 2, dimasukan ke dalam adonan tepung lalu di goreng"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Mengkal, namaRecipe: "Pisang Molen", description: "", gambarRecipe: "", bahanRecipe: [
        "1 sisir pisang yang masih mengkal","500 gr tepung terigu","100 gr margarin","3 sdm gula halus","1/4 sdt vanili bubuk","secukupnya air","minyak untuk menggoreng"
    ], instruksiRecipe: [
    "Campur tepung terigu, gula halus, margarin dan vanili","Tuangi air sedikit demi sedikit sambil di uleni sampai kalis","Giling adonan sampai ketebelan yang diinginkan. Lilitkan adonan pada pisang","Goreng adonan pada minyak yang belum terlalu panas sampai coklat ke emasan"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Bolu Marmer Pisang", description: "", gambarRecipe: "", bahanRecipe: [
        "250 gr tepung terigu", "250 gr pisang", "3 buah telur", "150 gr gula pasir", "110 ml minyak sayur", "110 ml susu (susu bubuk + air)", "1 sdt baking powder", "1/2 sdt baking soda", "1/2 bks vanili bubuk", "pasta coklat"
    ], instruksiRecipe: [
    "Panaskan oven. Selama itu siapkan loyang yang diolesi mentega dan taburan tepung terigu", "Mixer telur dan gula dengan kecepatan tinggi sampai putih mengental", "Masukan tepung terigu yang sudah ditambahi baking powder, baking soda, vanili. Matikan mixer", "Masukan ke dalam adonan, campuran minyak sayur, susu dan pisang yang sudah dilumatkan. aduk rata dengan spatula", "Tuangkan adonan ke dalam loyang dan masukan ke oven dan panggang", "Sebelum benar-benar matang, berikan pasta coklat ke dalam adonan dan panggang hingga matang"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Nagasari", description: "", gambarRecipe: "", bahanRecipe: [
        "9 buah pisang",
        "300 gr tepung beras",
          "3 sdm nutrijel plain",
          "2 sdm tepung maizena",
          "1 sdt garam",
          "10 sdm gula pasir",
          "5 sachet vanili kecil",
          "5 ruas daun pandan",
          "1000 ml air matang",
          "secukupnya daun pisang"
    ], instruksiRecipe: [
    "Campur semua bahan (tepung beras, tepung maizena, nutrijel plain, gula, vanili, air, 2 daun pandan, garam) lalu panaskan diatas kompor sampai menjadi bubur","Bersihkan daun pisang, potong kecil2 pisang dan daun pandan","Panaskan kukusan, letakan adonan tepung yang sudah menjadi bubur ke daun pisang, tambahkan pisang, kemudian tutup pisang dengan adonan dan beri potongan daun pandan","Bungkus nagasari dan kukus dalam waktu 30 menit"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Kolak Pisang", description: "", gambarRecipe: "", bahanRecipe: [
        "2 sisir pisang",
          "3-4 sdm gula merah yang sudah di iris",
          "3 sdm gula pasir",
          "3 gelas santan",
          "secukupnya garam",
          "secukupnya vanili",
        "150-200 ml air",
        "2 lembar daun pandan"
    ], instruksiRecipe: [
    "Potong-potong pisang",
        "Larutkan gula merah, air dan daun pandan. Setelah larut dan keluar uap, matikan kompor lalu saring larutan tersebut.",
        "Masukan kembali air gula ke panci sambil dimasak diatas kompor. Tambahkan santan, gula pasir, garam, vanili lalu aduk",
        "Masukan pisang dan tunggu hingga tekstur pisang mulai lembut",
        "Angkat dan kolak pisang siap disajikan"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Bolu Pisang", description: "", gambarRecipe: "", bahanRecipe: [
        "5 buah pisang",
          "3 butir telur",
          "100 gr gula pasir",
          "125 gr terigu",
          "1 sachet susu bubuk",
          "1 sdm maizena",
          "1/2 sdm bubuk kayu manis",
          "120 gr margarin cair",
          "Keju kraft cheddar untuk topping"
    ], instruksiRecipe: [
    "Siapkan loyang. Oles dengan margarin dan taburi dengan tepung terigu",
        "Haluskan pisang dengan garpu",
        "Panaskan oven dengan api kecil",
        "Mixer telur dan gula dengan kecepatan penuh hingga pucat dan mengembang",
        "Masukan pisang, mixer dengan kecepatan rendah. aduk hingga rata",
        "Masukan terigu dan maizena yang telah disaring, susu bubuk, kayu manis, margarin cair. aduk hingga rata",
        "Masukkan adonan ke loyang. Panggang di oven. Ketika bolu sudah stengah matang, beri keju parut diatasnya",
        "Panggang lagi hingga bolu matang"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Pisang Nugget", description: "", gambarRecipe: "", bahanRecipe: [
        "10 sdm tepung terigu",
          "5 buah pisang",
          "3 sdm gula",
          "1 butir telur",
          "4 sdm tepung terigu untuk baluran",
          "secukupnya tepung panir"
    ], instruksiRecipe: [
    "Lumatkan pisang. Kocok telur dan gula hingga larut",
        "Masukan terigu ke adonan telur aduk rata. Lalu, masukan pisang dan aduk adonan hingga tercampur rata",
        "Kukus adonan sampai matang",
        "Untuk baluran, buat adonan tepung terigu agak cair. Masukan potongan nugget ke dalam adonan tepung terigu kemudian tepung panir. Simpan di kulkas agar tepung panir menempel",
        "Goreng dengan api kecil sampai kecoklatan. Angkat dan sajikan dengan topping sesuai selera"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Matang, namaRecipe: "Puding Pisang Susu", description: "", gambarRecipe: "", bahanRecipe: [
        "5 buah pisang",
          "1 bungkus agar plain",
          "3 sdm gula pasir",
          "secukupnya susu kental manis",
          "sejumput garam",
          "1/2 sdt vanili",
          "750 ml air",
          "1 buah telur",
          "2 sdm tepung terigu"
    ], instruksiRecipe: [
    "Siapkan air. Masukan agar, gula, vanili, susu. Aduk hingga larut",
        "Buat adonan tepung terigu, yg diberi air dan telur. Kocok hingga rata",
        "Masakan adonan puding diatas kompor. Masukan adonan tepung ke dalam adonan pusing sambil diaduk hingga tercampur rata",
        "Masukan potongan pisang. Aduk hingga mendidih.",
        "Puding siap untuk dicetak"
    ], source: ""),
    Resep(jenisPisang: .Uli, tingkatKematangan: .Kematengan, namaRecipe: "Sale Pisang", description: "", gambarRecipe: "", bahanRecipe: [
        "1 sisir pisang", "secukupnya tepung beras", "secukupnya tepung terigu", "secukupnya air", "sejumput garam"
    ], instruksiRecipe: [
    "Iris pisang dan jemur kurang lebih 3-7 hari hingga pisang menghitam", "Siapkan adonan tepung yaitu tepung beras, tepung terigu dan garam. Masukan air dan aduk hingga mengental","Celupkan pisang ke dalam adonan tepung","Goreng dengan api sedang. Sale pisang siap disajikan",
    ], source: ""),
    Resep(jenisPisang: .Tanduk, tingkatKematangan: .Matang, namaRecipe: "Bola-bola Pisang", description: "", gambarRecipe: "", bahanRecipe: [
        "600 gr pisang","3 sdm gula pasir","8 sdm tepung terigu","1/2 sdt vanili bubuk","secukupnya tepung panir","minyak goreng"
    ], instruksiRecipe: [
    "Lumatkan pisang", "Campurkan semua bahan dan aduk rata", "Bulatkan adonan dan goreng hingga kuning kecoklatan"
    ], source: "")
]
