const columns = [
  {name: "Name", uid: "name", sortable: true},
  {name: "Type", uid: "type", sortable: true},
  {name: "Status", uid: "status", sortable: true},
  {name: "Actions", uid: "actions"},
];

const statusOptions = [
  {name: "Active", uid: "active"},
  {name: "Offboarded", uid: "offboarded"},
  {name: "Paused", uid: "paused"},
];

export {columns, statusOptions};