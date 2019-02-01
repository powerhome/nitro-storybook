# <%= @kit %> Rails
<%= pb_rails(:pbSpan, data: { :text => "I am pbSpan-Rails", :wrapperclass => "span-wrapper", :componentclass => "pb-span", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbSpan' %>
<%= pb_react('pbSpan', {text: 'I am pbSpan-React', wrapperclass: 'span-wrapper', componentclass: 'pb-span', show_props: defined?(@kit)}) %>
