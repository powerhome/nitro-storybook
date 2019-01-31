<h1><%= File.basename( __dir__) %></h1>

ERB: <%= pb_rails(:pbDiv, data: { text: "I'm a div div div", :wrapperclass => "div-wrapper", :componentclass => "div"}) %>

<br>
  
<%= javascript_pack_tag 'pbDiv' %>
React: <%= react_component('pbDiv', name: 'a component rendered from a view') %>

<hr>
