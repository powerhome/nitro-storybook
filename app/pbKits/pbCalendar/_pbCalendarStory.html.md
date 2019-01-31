ERB:
```
= pb_rails(:pbCalendar, data: { name: "Lisa" })
```
<%= pb_rails(:pbCalendar, data: { name: "Lisa" }) %>

<hr/>

ERB with Props:

```
= pb_rails(:pbCalendar, data: { name: "Lisa", show_props: true })
```

<%= pb_rails(:pbCalendar, data: { name: "Lisa", show_props: true }) %>

<hr/>

ERB with Props and Name:

```
= pb_rails_with_props(:pbCalendar, data: { name: "Lisa" })
```
<%= pb_rails_with_props(:pbCalendar, data: { name: "Lisa" }) %>

<br>

<%= javascript_pack_tag 'pbCalendar' %>
React:

```
= pb_react('pbCalendar', {name: 'Lisa'})
```
<%= pb_react('pbCalendar', {name: 'Lisa'}) %>

<br>

React with Props:

```
= pb_react('pbCalendar', {name: 'Lisa', show_props: true})
```
<%= pb_react('pbCalendar', {name: 'Lisa', show_props: true}) %>

<br>

React with Props and Name:

```
= pb_react_with_props('pbCalendar', {name: 'Lisa'})
```
<%= pb_react_with_props('pbCalendar', {name: 'Lisa'}) %>
