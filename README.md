# SAPI (Sistema de Administración de Pedidos de Ingeniería) 🚀

> Elevator Projects Made Effortless! 🛗

## Executive Summary 📌
In the past, managing elevator engineering orders was a challenge, bogged down by endless emails and confusing Excel spreadsheets. This led to inefficiencies, miscommunication, and missed opportunities. With SAPI, we've revolutionized this chaotic process. Now, teams can effortlessly track orders, delegate tasks, assign resources, and access real-time data. Decision-making has never been this streamlined, allowing businesses to move at lightning speed. ⚡️

## Powered by Hotwire 🌐
Utilizing the power of Hotwire, which incorporates both Turbo and Stimulus, SAPI offers a progressive web application experience that is as fast as light. This ensures rapid loading, seamless navigation, and an overall enhanced user experience.

## Design Documentation & Rationale 📘

Throughout the development of SAPI, we've made critical design decisions to ensure optimal user experience, maintainability, and scalability. To offer a window into our thought process, we've documented these choices. This way, our design flow, system architecture, and rationale behind each decision are transparent.

Delve into the design docs:
- [Kick-off meeting and db design](https://funny-tomato-23f.notion.site/Initial-Design-Doc-SAPI-EEVINT-5efda9b98b8440d68b52a8e4525c4a58?pvs=4)
- [Devise vs own authentication](https://funny-tomato-23f.notion.site/Devise-vs-own-authentication-Design-Doc-1963a88132b645e7839fc49a7831c9f1?pvs=4)
- [Design for navbar and sidebars](https://funny-tomato-23f.notion.site/Sidebar-navbar-Design-Doc-1-658c9c1d010d44099acbd553162cd2ca?pvs=4)
- [Enum values for some models attributes](https://funny-tomato-23f.notion.site/Enum-values-Elevator-PM-Design-Doc-2cf3e0846af7403a9cbc159118ebf2b7?pvs=4)
- [Nested attributes for Contract model](https://funny-tomato-23f.notion.site/Nested-Attributes-Elevator-PM-Design-Doc-0edaa84249f54c63ba34a22cfa967270?pvs=4)
- [Gems trade off](https://funny-tomato-23f.notion.site/Gems-Trade-off-Design-Doc-9167c06fb666430282817b04a1ea59c7?pvs=4)
- [TODO list 📝](https://funny-tomato-23f.notion.site/TODO-Elevator-PM-6f7438a7f057453b823d659139211340?pvs=4)
  
This documentation acts as a roadmap to understand SAPI's foundational principles, ensuring that future collaborators and stakeholders can seamlessly engage with, adapt, or scale the platform.

## Technical Specifications 🔧
- **Ruby Version:** 3.2.1 
- **Rails Version:** 7.0.5 
- **Database:** PostgreSQL 
- **Styling:** Tailwind CSS 
- **Testing Framework:** RSpec 

### Testing 🧪
Run the full suite of tests with:
```bash
rspec
```

### Databse setup
```bash
rails db:create
rails db:migrate
rails db:seed
```

### Gems installation
```bash
bundle install
```
