ERB: <%= pb_rails(:pbSpan, data: { text: "I'm a span yo, use me for span-like things", :wrapperclass => "span-wrapper", :componentclass => "span"}) %>

<br>
  
<%= javascript_pack_tag 'pbSpan' %>
React: <%= react_component('pbSpan', name: 'a span rendered from a view') %>
