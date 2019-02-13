<%= pb_rails("pb_body", props: { text: "This is my body paragraph", tag: "p", show_props: defined?(@kit) }) %>
<%= pb_rails("pb_body", props: { text: "This is my body paragraph", tag: "p", color: "light", show_props: defined?(@kit) }) %>
<%= pb_rails("pb_body", props: { text: "This is my body paragraph", tag: "p", color: "lighter", show_props: defined?(@kit) }) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
      component_props: {
          text: "This is my body paragraph",
          tag: "p",
          color: "lighter",
          show_props: defined?(@kit) }
end %>