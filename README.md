# CSCI201L_Group_Project
project notes:
- I started the login and registration pages to continue working on it you can just create a dynamic web project and add the jsp and css files
- also add the folders Images and Fonts in WebContent
- Login_Register is a package
- add sql connector jar to path
  
- database:
  - schema: schedulebuilder
  - tables:
    - User
      - iduser
      - userName
      - pass
    -  Major
      - idmajor
      - majorName
    - Course
      - idcourse
      - courseName
      - idmajor
    - CourseTaken
      - idct
      - iduser
      - idcourse
    - Friend
      - idfriend
      - iduser1
      - iduser2
