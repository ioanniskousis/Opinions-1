# Opinions - a Twitter redesign project

<img src="app/assets/images/bird-blue.png" alt="Opinions" width="40" height="40">
This is the Capstone project for the Ruby on Rails Course

<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/ioanniskousis/Opinions">
    <img src="app/assets/images/microverse.png" alt="Microverse Logo" width="80" height="80">
  </a>
  
  <h3 align="center">Opinions Application</h3>
  
  <p align="center">
    This project is part of the Microverse curriculum in Ruby On Rails course!
    <br />
    <a href="https://github.com/ioanniskousis/Opinions"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://blooming-meadow-82208.herokuapp.com">View Demo</a>
    <a href="https://github.com/ioanniskousis/Opinions/issues">Report Bug</a>
    <a href="https://github.com/ioanniskousis/Opinions/issues">Request Feature</a>
  </p>
</p>

Opinions is based on a redesign of Twitter.  
Is an application to share opinions about books, politics, health etc - anything that you can share opinions about with people who follow you.  


<hr />

## Application Screen Shots

## Sign Up

<img src="app/assets/images/sign-up.png" alt="program interface">
<hr />

## Log In

<img src="app/assets/images/log-in.png" alt="program interface">
<hr />

## Opinions - Home

<img src="app/assets/images/opinions-home.png" alt="program interface">
<hr />

## Users List

<img src="app/assets/images/users-list.png" alt="program interface">
<hr />

## Users List

<img src="app/assets/images/user-details.png" alt="program interface">
<hr />

## Users List

<img src="app/assets/images/user-opinions.png" alt="program interface">
<hr />

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
- [Entities Relationship Diagram](#erd)
- [Live Version](#live-version)
- [Application Instructions](#application-instructions)
- [System Requierments](#system-requierments)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Development](#development)
- [Testing](#testing)
- [Built With](#built-with)
- [Contributors](#contributors)
- [Copy Rights](#copyright)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

The project creates a database which holds 4 tables:

    - Users : Is the table containing the users' data  
      - Fields :  
        - string:   username  
        - string:   fullname 
        - datetime: created_at  
        - datetime: update_at  

    - Opinions : is the table containing the Opinions' data  
      - Fields:  
        - text:     text  
        - integer:  author_id  
        - datetime: created_at  
        - datetime: update_at  

    - Followings : Is the table that tracks users followings  
      - Fields  
        - integer: follower_id  
        - integer: followed_id  

    - Likes : Is the table that contains the users' likes on the Opinions  
      - Fields  
        - integer: opinion_id  
        - integer: user_id  

Additionally 2 tables are created by the ActiveStorage to keep links to the users' images

  - active_storage_attachments
  - active_storage_blobs

<hr/>

## ERD

<img src="docs/Opinions.png" alt="ERD">

<hr/>

<!-- ABOUT THE PROJECT -->
## Live version

You can see it working [![Heroku](https://pyheroku-badge.herokuapp.com/?app=blooming-meadow-82208)](https://blooming-meadow-82208.herokuapp.com)

## Application Instructions

- New users must sign up and give a username, and a fullname  
- The user logs in to the app, only by typing the username  
- A logged in user can create opinions about anything, follow othe users and check likes on other users opinions  
- Has access to all other users' details including their followers and followings  

- There are three main page  
  - Opinions (Home)  
  - Users with 4 sub-pages  
    - All - users sorted by their creation date  
    - Most Friendly - all users sorted by the number of other users that follow  
    - Most Popular - all users sorted by the number of followers  
    - Protagonists - all users sorted by the number of opinions they have created  
  - Profile with 4 sub-pages  
    - Details - the current user can edit their details  
    - Opinions - listing those created by the viewed user  
    - Following - listing the users that the viewed user follows  
    - Followers - listing the followers of the viewed user  

- All Users lists show the numbers of followees, followers and opinions with clickable links to the relevant page and sub-page. The image of the user links to the selected user's profile-page. Also, at the bottom-right of user's image 2 arrows, one to the left and one to the right, signal the following and followed users.    

- All Opinions lists show the opinion's author image linking to their profile and a clickable heart image allowing the current user to like-unlike each opinion.  

- The Right-Side-Bar  
  - The vertical bar at the right side  
    - In Home-page and Users-page shows a list of all users which the current user is not following, giving control to follow them by clicking an add-button to the right of each user  
    - In Profile-page lists the users that are following the viewed user. It provides the add-button for those that the current user is not following

- As required there are pages to Sign Up, to Log In and to Edit user's details  


<hr/>

## System Requierments

- Ruby
- Rails
- Yarn
- RSpec
- ActiveStorage

## Dependencies

- rspec-rails gem
- capybara gem
- selenium-webdriver gem
- chromedriver-helper gem

## Configuration

- first, clone the project
  Run

```
  git clone https://github.com/ioanniskousis/Opinions.git
```

- Install the necessary dependancies
  Run

```
  rails active_storage:install
  rails db:migrate

  bundle install
  rails generate rspec:install
  yarn install
```

<hr/>

## Development

- Clone the project

```
  https://github.com/ioanniskousis/Opinions.git
```

<hr/>

## Testing

- Tests have been included using RSpec for controllers, views and models
- Location /spec/tests/
- 5 test files
  - features_spec.rb  
  - following_spec.rb  
  - like_spec.rb  
  - opinion_spec.rb  
  - user_spec.rb    

### Controller test files implement the views tests as well.

<hr/>

## Built With

This project was built using these technologies.

- Ruby version 2.6
- Ruby On Rails version 6.0
- rspec
- capybara
- ActiveStorage

<hr/>

<!-- CONTACT -->

## Contributors

:bust_in_silhouette: **Author**

## Ioannis Kousis

- Github: [@ioanniskousis](https://github.com/ioanniskousis)
- Twitter: [@ioanniskousis](https://twitter.com/ioanniskousis)
- Linkedin: [Ioannis Kousis](https://www.linkedin.com/in/jgkousis)
- E-mail: jgkousis@gmail.com


<hr/>
<!-- ACKNOWLEDGEMENTS -->

## CopyRight

### Thanks to Gregoire Vella

 [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)  
 [And his ideas](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details)  

## Acknowledgements

- [Microverse](https://www.microverse.org/)
- [The Odin Project](https://www.theodinproject.com/)
- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
- [Gregoire Vella](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/ioanniskousis/Opinions.svg?style=flat-square
[contributors-url]: https://github.com/ioanniskousis/Opinions/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ioanniskousis/Opinions.svg?style=flat-square
[forks-url]: https://github.com/ioanniskousis/Opinions/network/members
[stars-shield]: https://img.shields.io/github/stars/ioanniskousis/Opinions.svg?style=flat-square
[stars-url]: https://github.com/ioanniskousis/Opinions/stargazers
[issues-shield]: https://img.shields.io/github/issues/ioanniskousis/Opinions.svg?style=flat-square
[issues-url]: https://github.com/ioanniskousis/Opinions/issues
