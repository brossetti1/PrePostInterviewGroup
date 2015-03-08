## Pre-Post Interview

The Iron Yard and Soltech put together a Hack-a-thon from March 6-8.  The following requirements were provided for this 44 hour hack-a-thon.

**Team members**:

* Bob Holben - Front end
* Jide Opeola - iOS
* William Judd - iOS
* Brian Rossetti - Ruby on Rails
* William Jones - Ruby on Rails

**Summary**:

This app makes organizing and tracking your job search activity easy while providing helpful tips along the way.

**Target Audience**:

This application is geared towards people currently in the process of looking for a job.

**Users**:

* Job seekers

**Requirements / Suggested Features**:

* Create your profile and login info
* Log of companies, short summary of opportunity, short summary of company, rating each opportunity on your interest level and lead source (brevity is key)
* Save your resume on file to save easily
* Date you submitted your resume
* Phone, face-to-face and virtual interview tips
* Pre-Interview Checklist (online research, interviewers, location info, obtain business cards for follow up, key findings)
* Post interview checklist (recorded key takeaways, how did it go, describe the conversatoin, who you met with, thank you notes, follow up tracking, status updates to lead source if referred, ask recruiter to follow up on feedbac if applicable, other)
* Time out your thank you notes (templates)
* Post interview key takeaways (options for voice, text and voice-to-text memos)
* Pros and cons of the opportunity
* Quick page on UI that shows list of opportunities and ability to quickly pull up summary and status


## API End Point

<strong>https://pre-post-interview.herokuapp.com</strong>

## local development server

<strong>http://brian.t.proxylocal.com</strong>

##Using Authentication Tokens

an authentication token will be generated when a user is created. the authentication token will be passed from the backend when a user successfully logs in. After login, the authentication token will have to come with each request in either of the below formats in order to avoid an "authentication failure". The formats are as follows:
	
*sent in the **header** as "authentication_token": "xV47wpXmfMB4zMCL3sk"
*unnested and sent in the **body** as "authentication_token": "xV47wpXmfMB4zMCL3s-k"

##Responses

all responses from the API will be delivered in json format.

#Users

##**sign up/create user**

####Request

`POST /users`

```json
{
	"user": {
	 	"email": "testing@testing3.com",
     	"password": "password",
     	"password_confirmation": "password"
    }
}
```

####Response
`Status: 201 Created`

creates a user, returns a success message, email, and authentication token.

```json
{
	"user": {
		"email": "testing@testing.com",
		"authentication_token": "xV47wpXmfMB4zMCL3s-k"
		}
}
```
error examples:

```json
{
	"messages": [
		"Email can't be blank"
	]
}
```
##**sign in**

####Request


`POST /users/sign_in`


```json
{
	"user": {
		"email": "testing@testing.com",
		"password": "password",
	   }
}
```

allows a user to sign in. optionally, you can pass username or email as `:login `or `:username` to the `users/sign_in` route and get a successful sign in if the parameter matches either the email or username of the user and the passwor d is correct.

####Response

`Status: 200 OK`

```json
{
	"user": {
		"user_id": "2",
		"username": null,
		"email": "testing@testing.com",
		"authentication_token": "uvGRGDE4eYe_zoLR95QJ"
	}
}
```

##**log out**

####Request

`DELETE users/sign_out`

####Response
currently, there is no response on sign out because each request handles every api call.


##**create new company**

####Request


`POST /company`


```json
{
    "name": "Delta"
}
```

allows a user to create a new company.

####Response

`Status: 201 Created`

```json
{
  "company": {
        "id": 3,
        "name": "Delta"
    }
}
```

##**request list of Companies**

####Request

`GET /company`

####Response

`Status: 200 ok`

```json
[
  {
    "company_id": 9,
    "name": "Sauer Inc"
  },
  {
    "company_id": 10,
    "name": "Muller Group"
  },
  {
    "company_id": 13,
    "name": "test co"
  }
]
```

##**request Company details**
####**along with all Job and Event details

<strong>This call returns details for all companies, jobs, and events for the requesting user(as indicated by the authentication token being sent)</strong>


####Request

`GET /companies`

####Response

`Status: 200 ok`

```json
[
  {
    "id": 1,
    "name": "Goyette, Rippin and Shields",
    "jobs": [
      {
        "job_id": 1,
        "job_title": "historian",
        "lead_source": "Jena Kiehn",
        "short_summary": "Dens absorbeo minus et.",
        "salary": 0,
        "events": [
          {
            "event_id": 1,
            "research": "Porro quis laboriosam iure assumenda.",
            "key_findings": "Natus non delectus ut iste fugit facilis ea.",
            "takeaways": "Eos nisi impedit quo quidem.",
            "outcome": "Debitis nihil cum hic dolore ipsum eos voluptas.",
            "thankyou_note": false,
            "follow_up": false,
            "referral": true,
            "feedback": false,
            "business_card": false
            },
          {
            "event_id": 2,
            "research": "Deleniti error repudiandae sed et explicabo animi.",
            "key_findings": "Nisi quaerat corporis ut quisquam nihil.",
            "takeaways": "Rerum illo dolor sit ut aut.",
            "outcome": "Iure fugit qui sit molestias.",
            "thankyou_note": true,
            "follow_up": true,
            "referral": false,
            "feedback": true,
            "business_card": true
            },
        ]
    },
      {
        "job_id": 2,
        "job_title": "Lead Communications Supervisor",
        "lead_source": "Ivy Wunsch",
        "short_summary": "Curvo tardus thalassinus auris suggero solium.",
        "salary": 0,
        "events": [
```

##**show jobs associated with a Company**

####Request

`GET /companies/:id`

####Response

`Status: 200 ok`


```json
{
    "jobs": [
        {
            "job_id": 7,
            "job_title": "Dynamic Communications Technician"
        },
        {
            "job_id": 8,
            "job_title": "Future Web Representative"
        },
        {
            "job_id": 9,
            "job_title": "Chief Creative Officer"
        },
        {
            "job_id": 19,
            "job_title": "Senior Paradigm Associate"
        },
        {
            "job_id": 20,
            "job_title": "Product Marketing Executive"
        },
        {
            "job_id": 21,
            "job_title": "Regional Tactics Developer"
        }
    ]
}
```

##**create a new job**

####Request


`POST /company/company_id/jobs`

```json
{
    "job": 
        {
        "job_title": "testingstuff", 
        "lead_source": "testingstuff",
        "pros": ["testing pro create","testprocreate","test_pro_create"],
        "cons": ["testing pro create","testprocreate","test_pro_create"],
        "short_summary": "testingstuff", 
        "salary": 1425352
    }
}
```

####Response

`Status: 201 Created`

```json
{
    "job": {
        "job_id": "2",
        "job_title": "testingstuff",
        "lead_source": "testingstuff",
        "short_summary": "testingstuff",
        "salary": 1425352,
        "cons": [
            "testing pro create",
            "testprocreate",
            "test_pro_create"
        ],
        "pros": [
            "testing pro create",
            "testprocreate",
            "test_pro_create"
        ],
        "company_id": 1,
        "created_at": "2015-03-08T00:05:13.312Z",
        "updated_at": "2015-03-08T00:05:13.312Z",
        "user_id": 1
    }
}
```
