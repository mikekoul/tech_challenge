# Take Home Assessment

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Tech Stack"> ➤ Tech Stack</a></li>
    <li><a href="#Routes"> ➤ Routes</a></li>
    <li><a href="#Endpoints"> ➤ Endpoints</a></li>
    <li><a href="#Schema"> ➤ Schema</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
 </details>
 
  <!-- Tech Stack -->
<h2 id="Tech Stack"> 💻 Tech Stack</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>pry</li>
  <li>SimpleCov</li>
  <li>JSON API Serializer</li>
  <li>Shoulda-Matchers</li>
  </ul>
  
  <!-- ROUTES -->
<h2 id="Routes"> :open_file_folder: Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| resources  | api/v1/customers/:id/subscriptions  | only: [ :index ]  |
| resources  | api/v1/subscriptions  | only: [ :create, :update ]  |

  <!-- Endpoints -->
<h2 id="Endpoints"> :book: Endpoints</h2>
* GET api/v1/customers/:id/subscriptions
<img src="https://user-images.githubusercontent.com/44381885/199998797-9017738d-306c-474b-8ec9-a6c3e60f1c7c.png" width=50% height=50%>



