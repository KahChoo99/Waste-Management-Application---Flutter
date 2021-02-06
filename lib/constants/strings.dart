// common
const sAppTitle = "Solid Waste Management";
const sUsername = "Username";
const sPassword = "Password";
const sOr = "Or";
const sCannotBeEmpty = "Cannot Be Empty";
const sWrongPassword = "Wrong Password";
const sLogin = "Login";
const sHome = "Home";
const sLogOut = "Log Out";
const sOk = "Ok";
const sRetry = "Retry";

// User
const sUserLogin = "User Login";
const sNoUsernameFound = "No Username Found";
const sSignUp = "Sign Up";
const sConfirmPassword = "Confirm Password";
const sUserRegister = "User Register";
const sUsernameHasBeenTaken = "Username Has Been Taken";
const sMustBeTheSameAs = "Must Be The Same As";
const sPleaseUseValidEmail = "Please Use Valid Email with @ and .com";
const sRegisterUserSuccessfully = "Register Account Successfully";
const sUserDetail = "User Detail";
const sRegisterComplaints = "Register Complaints";
//// Register Complaints
const sAddComplaint = "+ Complaint";
const sBinID = "Bin ID";
const sFTState = "FT/State";
const sDistrict = "District";
const sSubDistrict = "Sub District";
const sArea = "Area";
const sCleaningPeriod = "Cleaning Period";
const sPostComplaint = "Post Complaint";
const sMessage = "Message";
const sDescription = "Description";
const sContinue = "Continue";
const sPleaseWriteSomeMessage = "Please Write Some Message. Thanks!";
const sConfirm = "Confirm?";
const sSubmit = "Submit";
const sCancel = "Cancel";
const sSubmitSuccessfully = "Submit Successfully";
const sComplaintID = "Complaint ID";
//// My Complaints
const sMyComplaints = "My Complaints";
const sStatus = "Status";
const sPending = "Pending";
const sCompleted = "Completed";
//// My Profile
const sMyProfile = "My Profile";
const sName = "Name";
const sEmail = "Email";
const sAddress = "Address";
const sUserID = "User ID";
const sEditProfile = "Edit Profile";
const sSave = "Save";
const sSaveSuccessfully = "Save Successfully";

// Admin
const sAdmin = "Admin";
const sAdminLogin = "Admin Login";
const sWrongAdminUsername = "Wrong Admin Username";
//// Create Bin
const sCreateBin = "Create Bin";
const sSelectFTState = "Select FT/State";
const sSelectDistrict = "Select District";
const sSelectSubDistrict = "Select Sub District";
const sCreate = "Create";
const sPleaseSetAValidAreaName = "Please Set A Valid Area Name";
const sDaysPerWeek = "days per week";
const sPleaseSetInRange1To7Days = "Please Set In The Range (1-7) Day/s";
const sCreateSuccessfully = "Create Successfully";
const sHowManyDaysPerWeek = "How Many Days Per Week";
//// Update Bins
const sUpdateBins = "Update Bins";
const sUpdate = "Update";
const sUpdateSuccessfully = "Update Successfully";
//// View Complaints
const sViewComplaints = "View Complaints";
const sUpdateStatus = "Update Status";
const sComment = "Comment";
const sUpdated = "Updated";
//// View Work Report
const sViewWorkReport = "View Work Report";
//// Users Details
const sViewUserDetails = "User Details";

const list_sFTState_sDistrict_SubDistrict = {
  // JOHOR
  "Johor": {
    "Batu Pahat": [
      "Ayer Hitam",
      "Kangkar Bahru",
      "Minyak Beku",
      "Parit Raja",
      "Parit Sulong",
      "Parit Yaani",
      "Rengit",
      "Segenting",
      "Semerah",
      "Senggarang",
      "Sri Gading",
      "Sri Medan",
      "Taman Bukit Pasir",
      "Taman Flora Utama",
      "Taman Setia Jaya 2",
      "Tongkang Pechah",
      "Yong Peng"
    ],
    "Johor Bahru": [
      "Bakar Batu",
      "Bandar Baru Kangkar Pulai",
      "Bandar Baru UDA",
      "Bukit Chagar",
      "Bukit Indah",
      "Bukit Senyum",
      "Century",
      "Damansara Aliff",
      "Danga Bay",
      "Dato' Onn",
      "Daya",
      "Desa Cemerlang",
      "Desa Jaya",
      "Desa Tebrau",
      "EduCity",
      "Ehsan Jaya",
      "Eko Botani",
      "Forest City",
      "Gaya",
      "Johor Jaya",
      "Kangkar Tebrau",
      "Kempas",
      "Kong Kong",
      "Kota Iskandar",
      "Kota Masai",
      "Larkin",
      "Ledang Heights",
      "Lima Kedai",
      "Majidee",
      "Medini",
      "Melodies",
      "Molek",
      "Mount Austin",
      "Mutiara Rini",
      "Nong Chik",
      "Nusa Bestari",
      "Pandan",
      "Pasir Pelangi",
      "Pelangi",
      "Pelangi Indah",
      "Pendas",
      "Perling",
      "Permas Jaya",
      "Pulai Hijauan",
      "Pulai Indah",
      "Pulai Mutiara",
      "Puteri Harbour",
      "Puteri Wangsa",
      "Selesa Jaya",
      "Seri Alam",
      "Setia Indah",
      "Setia Tropika",
      "Sri Tebrau",
      "Stulang",
      "Sungai Tiram",
      "Sunway Iskandar",
      "Suria",
      "Sutera Utama",
      "TUTA",
      "Taman Scientex",
      "Tanjung Kupang",
      "Tanjung Langsat",
      "Tanjung Pelepas",
      "Tasek Utara",
      "Universiti"
    ],
    "Kluang": [
      "Bandar Seri Impian",
      "Chamek",
      "Kahang",
      "Layang-Layang",
      "Machap",
      "Mengkibol",
      "Renggam",
      "Taman Sri Lambak"
    ],
    "Kota Tinggi": [
      "Bandar Mas",
      "Bandar Tenggara",
      "Desaru",
      "FELDA Air Tawar 2",
      "FELDA Lok Heng",
      "FELDA Waha",
      "Lombong",
      "Pasir Gogok",
      "Tanjung Balau",
      "Tanjung Pengelih",
      "Teluk Ramunia",
      "Teluk Sengat"
    ],
    "Kulai": [
      'Bandar Indahpura',
      'Bandar Putra Kulai',
      'Bukit Batu',
      'FELDA Taib Andak',
      'Kelapa Sawit',
      'Saleng',
      'Sedenak',
      'Seelong',
      'Senai International Airport',
      'Ulu Choh'
    ],
    "Mersing": ["Air Papan", "Endau", "Jemaluang", "Tenggaroh"],
    "Muar": [
      "Bandar Universiti Pagoh",
      "Bukit Bakri",
      "Bukit Kepong",
      "Bukit Mor",
      "Bukit Naning",
      "Bukit Treh",
      "Jorak",
      "Lenga",
      "Panchor",
      "Parit Bakar",
      "Parit Sakai",
      "Parit Unas",
      "Sabak Awor",
      "Simpang Jeram",
      "Sungai Abong",
      "Sungai Balang",
      "Tanjung Selabu"
    ],
    "Pontian": [
      "Ayer Baloi",
      "Benut",
      "Kampung Kayu Ara Pasong",
      "Kukup",
      "Pekan Nanas"
    ],
    "Segamat": [
      "Air Panas",
      "Bekok",
      "Buloh Kasap",
      "Chaah",
      "Gemas Baru",
      "Genuang",
      "Jementah",
      "Kampung Tengah",
      "Sungai Karas",
      "Tenang"
    ],
    "Tangkak": [
      "Bukit Gambir",
      "Bukit Kangkar",
      "Parit Bunga",
      "Sagil",
      "Sengkang",
      "Tanjung Agas"
    ]
  },

  // SELANGOR
  "Selangor": {
    "Gombak": [
      "Ampang",
      "Batu 20",
      "Batu Caves",
      "Kampung Sungai Pusu",
      "Kundang",
      "Rawang",
      "Selayang",
      "Setapak",
      "Sungai Buloh",
      "Taman Templer",
      "Ulu Klang"
    ],
    "Hulu Langat": [
      "Batu 23",
      "Batu 26",
      "Beranang",
      "Cheras",
      "Desa Raya",
      "Hulu Langat",
      "Hulu Semenyih",
      "Kacau",
      "Kajang",
      "Kampung Pasir Batu 14 Semenyih",
      "Kampung Sungai Tangkas",
      "Kelanang",
      "Rumah Murah Sungai Lui",
      "Simpang Balak",
      "Sri nanding",
      "Sungai Kembong Beranang",
      "Sungai Lui",
      "Sungai Makau",
      "Sungai Raya",
      "Tanjong 12",
      "Tarun"
    ],
    "Hulu Selangor": [
      "Bukit Beruntung",
      "Bukit Sentosa",
      "Kerling",
      "Kuala Kalumpang",
      "Kuala Kubu Bharu",
      "Peretak",
      "Serendah",
      "Sungai Chick",
      "Sungai Choh",
      "Sungai Gumut",
      "Ulu Yam",
      "Ulu Yam Baru"
    ],
    "Klang": [
      "Batu 4",
      "Bukit Kemuning",
      "Bukit Raja",
      "Kapar",
      "Klang",
      "Kota Kemuning",
      "Pandamaran",
      "Port Klang",
      "Taman Sri Muda",
      "Telok Menegun"
    ],
    "Kuala Langat": [
      "Bandar Saujana Putra",
      "Batu",
      "Bukit Changgang",
      "Chodoi",
      "Jenjarom",
      "Jugra",
      "Kanchong",
      "Kanchong Darat",
      "Kelanang Batu 6",
      "Morib",
      "Permatang Pasir",
      "Sijangkang",
      "Sungai Raba",
      "Telok",
      "Teluk Datok",
      "Tongkah"
    ],
    "Kuala Selangor": [
      "Api-api",
      "Bukit Belimbing",
      "Bukit Melawati",
      "Bukit Talang",
      "Ijok",
      "Kampung Kuantan",
      "Kg. Baru Hulu Tiram Buruk",
      "Kuala Selangor",
      "Kuala Sungai Buloh",
      "Parit Mahang",
      "Pasangan",
      "Pasir Penambang",
      "Simpang 3",
      "Simpang 3 Ijok",
      "Sungai Sembilang",
      "Taman PKNS",
      "Tambak Jawa",
      "Ujong Permatang",
      "Ulu Tinggi"
    ],
    "Petaling": [
      "Bandar Sri Damansara",
      "Batu Tiga",
      "Country Heights",
      "Damansara",
      "Desa Puchong",
      "Glenmarie",
      "Kayu Ara",
      "Merbau Sempak",
      "Penaga",
      "Petaling Jaya",
      "Puchong",
      "Puchong Jaya",
      "Puchong Perdana",
      "Serdang",
      "Shah Alam",
      "Subang Jaya",
      "Sungai Besi"
    ],
    "Sabak Bernam": ["Sabak", "Sekinchan", "Sungai Besar"],
    "Sepang": [
      "16 Sierra",
      "Beranang",
      "Bukit Puchong 2",
      "Cyberjaya",
      "Dengkil",
      "Puchong",
      "Pulau Meranti",
      "Salak Tinggi",
      "Taman Mas",
      "Taman Meranti Jaya",
      "Taman Putra Perdana",
      "Taman Putra Prima"
    ]
  }
};
