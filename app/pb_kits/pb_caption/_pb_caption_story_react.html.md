<%= javascript_pack_tag 'pb_caption' %>
<%= pb_react('pb_caption', props: {text: 'This is my caption', show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
    component_props: {
        text: "This is my caption",
        tag: "p",
        large: true,
        show_props: defined?(@kit) }
end %>
