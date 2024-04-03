class DataForm {
  static List<Map<String, dynamic>> typesForm = [
    {
      "uuid": "cdcf616b-b628-4018-8c1b-6db88e698677",
      "title": "Konten",
      "subs": [
        {
          "title": "Judul",
          "name": "judul",
          "type": "title",
          "is_content": true,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Deskripsi",
          "name": "deskripsi",
          "type": "description",
          "is_content": true,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Gambar",
          "name": "gambar",
          "type": "images",
          "is_content": true,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    },
    {
      "uuid": "ec447082-06dc-4997-9143-c79171e2c182",
      "title": "Text & Angka",
      "subs": [
        {
          "title": "Jawaban Singkat",
          "name": "jawaban_singkat",
          "type": "text",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Jawaban Panjang",
          "name": "jawaban_panjang",
          "type": "textarea",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Jawaban Angka",
          "name": "jawaban_angka",
          "type": "number",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    },
    {
      "uuid": "2cd607ab-935c-4f75-a13c-700bac4ac7fc",
      "title": "Pilihan",
      "subs": [
        {
          "title": "Pilihan Ganda",
          "name": "multiple_choice",
          "type": "radio",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Kotak Centang",
          "name": "checkbox",
          "type": "checkbox",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Dropdown",
          "name": "dropdown",
          "type": "dropdown",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    },
    {
      "uuid": "4c0d2a6a-f095-429f-865a-49048e2d3a37",
      "title": "Informasi Kontak",
      "subs": [
        {
          "title": "Nomor Telepon",
          "name": "nomor_telepon",
          "type": "phone_number",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Alamat",
          "name": "alamat",
          "type": "address",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": [
              {
                "title": "Provinsi",
                "name": "provinsi",
                "url_data":
                    "https://data.ekosistemdatajabar.id/api-form/hierarki/geografis-indonesia/provinsi",
                "can_be_filled_after": null
              },
              {
                "title": "Kabupaten/Kota",
                "name": "kab_kota",
                "url_data":
                    "https://data.ekosistemdatajabar.id/api-form/hierarki/geografis-indonesia/kab-kota?kode_provinsi=",
                "can_be_filled_after": "provinsi"
              },
              {
                "title": "Kecamatan",
                "name": "kecamatan",
                "url_data":
                    "https://data.ekosistemdatajabar.id/api-form/hierarki/geografis-indonesia/kecamatan?kode_kab_kota=",
                "can_be_filled_after": "kab_kota"
              },
              {
                "title": "Kelurahan",
                "name": "kelurahan",
                "url_data":
                    "https://data.ekosistemdatajabar.id/api-form/hierarki/geografis-indonesia/kelurahan?kode_kecamatan=",
                "can_be_filled_after": "kecamatan"
              },
              {
                "title": "Kode Pos",
                "name": "kode_pos",
                "url_data":
                    "https://data.ekosistemdatajabar.id/api-form/hierarki/geografis-indonesia/kode-pos?kode_kecamatan=",
                "can_be_filled_after": "kelurahan"
              },
              {
                "title": "Alamat Lengkap",
                "name": "alamat_lengkap",
                "url_data": null,
                "can_be_filled_after": "kode_pos"
              }
            ]
          }
        },
        {
          "title": "Email",
          "name": "email",
          "type": "email",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Deteksi Lokasi",
          "name": "deteksi_lokasi",
          "type": "current_location",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    },
    {
      "uuid": "a6340be4-bdd2-4271-8faa-aee191a67d15",
      "title": "Nilai",
      "subs": [
        {
          "title": "Scale Rating",
          "name": "scale_rating",
          "type": "scale_rating",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Star Rating",
          "name": "star_rating",
          "type": "star_rating",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "NPS",
          "name": "nps",
          "type": "nps",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    },
    {
      "uuid": "a0373f7a-9451-4ca1-a213-74fad42a66e7",
      "title": "Lain-lain",
      "subs": [
        {
          "title": "Waktu",
          "name": "waktu",
          "type": "time_picker",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Tanggal",
          "name": "tanggal",
          "type": "date_picker",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Link",
          "name": "link",
          "type": "link",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        },
        {
          "title": "Upload",
          "name": "upload",
          "type": "upload",
          "is_content": false,
          "rules": {
            "required": null,
            "can_be_filled_after": null,
            "multiple": null,
            "settings": null,
            "is_identifier": null,
            "max_length": null,
            "min_length": null,
            "is_dynamic": null,
            "logic": null,
            "api_url": null
          }
        }
      ]
    }
  ];
}
