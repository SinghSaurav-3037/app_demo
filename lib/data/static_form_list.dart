final List<Map<String, dynamic>> staticFormList = [
  {
    "key": "password",
    "label": "Password",
    "type": "password",
    "maxLength": 15,
    "minLength": 8,
    "required": true,
    "validation": {
      "pattern":r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$",
      "message": "Password must contain at least 8 characters with one uppercase, one lowercase, and one number"
    },
    "inputType": "textPassword",
    "allowedCharacters": r"qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890@$*",
  },
  {
    "key": "full_name",
    "label": "Name",
    "type": "text",
    "required": true,
    "validation": {
      "message": "Enter valid name"
    },
    "inputType": "textPersonName",
    "allowedCharacters": "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM "
  },
  {
    "key": "username",
    "label": "UserName",
    "type": "text",
    "required": true,
    "validation": {
      "message": "Enter valid username"
    },
    "inputType": "textUserName",
    "allowedCharacters": "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM "
  },
  {
    "key": "gender",
    "label": "Gender",
    "type": "dropdown",
    "required": true,
    "maxLength": 20,
    "validation": {
      "message": "Gender not valid"
    },
    "options": [
      {
        "name": "Male",
        "tag": "1",
        "id": "Male"
      },
      {
        "name": "Female",
        "tag": "2",
        "id": "Female"
      },
      {
        "name": "Other",
        "tag": "3",
        "id": "Other"
      }
    ]
  },
  {
    "key": "birth_date",
    "label": "Select Date of Birth",
    "type": "date",
    "required": true,
    "maxLength": 20,
    "validation": {
      "message": "Select valid date"
    },
    "datePickerConfig": {
      "mode": "past_only",
      "maxDate": "current",
      "minDate": "70_years_ago"
    }
  },
  {
    "key": "mobile_no",
    "label": "Contact Number",
    "type": "phone",
    "required": true,
    "maxLength": 10,
    "minLength": 10,
    "validation": {
      "pattern": r"^[6-9]{1}[0-9]{9}$",
      "message": "Invalid phone number"
    },
    "inputType": "phone",
    "allowedCharacters": "1234567890",
    "requiresOTP": true
  },
  {
    "key": "mobile_no_alternative",
    "label": "Alternate Contact Number (Optional)",
    "type": "phone",
    "required": false,
    "maxLength": 10,
    "minLength": 10,
    "validation": {
      "pattern": r"^[6-9]{1}[0-9]{9}$",
      "message": "Invalid alternate phone number 1",
      "validateIfNotEmpty": true
    },
    "inputType": "phone",
    "allowedCharacters": "1234567890"
  },
  {
    "key": "mobile_alternate_two",
    "label": "Alternate Contact Number 2 (Optional)",
    "type": "phone",
    "required": false,
    "maxLength": 10,
    "minLength": 10,
    "validation": {
      "pattern": r"^[6-9]{1}[0-9]{9}$",
      "message": "Invalid alternate phone number 2",
      "validateIfNotEmpty": true
    },
    "inputType": "phone",
    "allowedCharacters": "1234567890"
  },
  {
    "key": "email",
    "label": "Email ID",
    "type": "email",
    "required": true,
    "maxLength": 60,
    "validation": {
      "pattern": "(?:[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])",
      "message": "Invalid email ID"
    },
    "inputType": "textEmailAddress"
  },
  {
    "key": "project",
    "label": "Select Academy",
    "type": "dropdown",
    "required": true,
    "validation": {
      "message": "Invalid academy"
    },
    "options": [
      {
        "id": "PRJ-00042",
        "tag": "PRJ-00042",
        "name": "Smart Academy Project"
      },
      {
        "id": "PRJ-00277",
        "tag": "PRJ-00277",
        "name": "Sunny Singh"
      },
      {
        "id": "PRJ-00294",
        "tag": "PRJ-00294",
        "name": "Cello Project"
      },
      {
        "id": "PRJ-00297",
        "tag": "PRJ-00297",
        "name": "KKKLL"
      },
      {
        "id": "PRJ-00455",
        "tag": "PRJ-00455",
        "name": "DHW New"
      },
      {
        "id": "PRJ-00489",
        "tag": "PRJ-00489",
        "name": "Cross"
      }
    ]

  },
  {
    "key": "category",
    "label": "Select Category",
    "type": "dropdown",
    "required": true,
    "validation": {
      "message": "Invalid category selected"
    },
    "options": [
      {
        "id": "CT465",
        "tag": "CT465",
        "name": "Test Consultant"
      },
      {
        "id": "Alumni",
        "tag": "Alumni",
        "name": "Alumni"
      },
      {
        "id": "CT490",
        "tag": "CT490",
        "name": "BBHH"
      },
      {
        "id": "Individual",
        "tag": "Individual",
        "name": "Individual"
      },
      {
        "id": "NGO Partner",
        "tag": "NGO Partner",
        "name": "NGO Partner"
      },
      {
        "id": "Others",
        "tag": "Others",
        "name": "Others"
      },
      {
        "id": "CT502",
        "tag": "CT502",
        "name": "test"
      }
    ]
  },
  {
    "key": "referral_code",
    "label": "Enter Referral Code",
    "type": "text",
    "required": false,
    "maxLength": 10,
    "inputType": "text"
  }
];
