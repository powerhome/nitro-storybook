ERB:
```
= pb_rails(:pbButton, data: { text: "Click Here!", :wrapperclass => "kit-btn-wrapper", :componentclass => "kit-btn"})
```
<%= pb_rails(:pbButton, data: { text: "Click Here!", :wrapperclass => "kit-btn-wrapper", :componentclass => "kit-btn"}) %>

<%= javascript_pack_tag 'pbButton' %>
React:
<%= react_component('pbButton', name: 'a button rendered from a view') %>
