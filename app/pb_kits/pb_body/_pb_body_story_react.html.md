<%= javascript_pack_tag 'pb_body' %>
<%= pb_react('Body', props: {show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
render 'config/ui/propsTableSimple',
component_props: {
text: "This is my body paragraph",
tag: "p",
color: "lighter",
show_props: defined?(@kit) }
end %>