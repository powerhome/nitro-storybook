# <%= @kit %> Rails
<%= pb_rails(:pbHeading, data: { :text => "I am pbHeading-Rails", :wrapperclass => "span-wrapper", :componentclass => "pb-span", :show_props => defined?(@kit) }) %>

<br/><hr/><br/>

# <%= @kit %> React
<%= javascript_pack_tag 'pbHeading' %>
<%= pb_react('pbHeading', {text: 'I am pbHeading-React', wrapperclass: 'span-wrapper', componentclass: 'pb-span', show_props: defined?(@kit)}) %>
