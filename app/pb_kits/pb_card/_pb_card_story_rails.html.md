<%= pb_rails(:pb_card, props: { name: "Tim", show_props: defined?(@kit) }) %>

<%= render 'config/ui/propsTableSimple',
    component_props: {
        name: "Tim",
        show_props: defined?(@kit) } %>
