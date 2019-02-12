<%= javascript_pack_tag 'pb_card' %>
<%= pb_react('pb_card', props: {name: 'Tim', show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
    component_props: {
        name: "Tim",
        show_props: defined?(@kit) }
end %>
