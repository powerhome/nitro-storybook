<h1><%= File.basename( __dir__) %></h1>

ERB: <%= pb_rails(:pbSpan, data: { text: "I'm a span yo, use me for span-like things", :wrapperclass => "span-wrapper", :componentclass => "span"}) %>

<%= javascript_pack_tag 'pbSpan' %>
React: <%= react_component('pbSpan', name: 'a span rendered from a view') %>

<hr>
