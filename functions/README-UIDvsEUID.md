Key Differences Between UID and EUID

Feature 	         |   UID (Real User ID)	                               |  EUID (Effective User ID)                       |
| ---------------- | --------------------------------------------------- | ----------------------------------------------- |
Purpose	           |   Identifies the owner/launcher of the process.	   |  Determines the process's active permissions.   |
Typical Value	     |   Your actual login ID (e.g., 1000).	               |  Usually the same as UID, unless escalated.     |
When It Changes	   |   Rarely; identifies the "real" user.	             |  Changes during setuid programs or sudo.        |
