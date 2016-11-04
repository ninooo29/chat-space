#ChatSpace

##Database creation

##tables

###users
| column | type | unique | index | null |
|:------:|:----:|:------:|:-----:|:----:|
| name | string |        | true  | false |
| email | string | true  | true  | false |
| group_id | integer |

###messages
| column | type |foreign_key|
|:------:|:----:|:---------:|
| body   | text |
| images | string |
| group_id | references | true |
| user_id | integer |

###groups
| column | type | unique | null | foreign_key |
|:------:|:----:|:------:|:----:|:-----------:|
| group_name | string | true | false |
| user_id | references ||| true |

###users_groups
| column |type|
|:------:|:--:|
| user_id | integer |
| group_id| integer |

##association

###User
- has_many:users_groups
- has_many:groups, through: :users_groups
- has_many:messages

###Message
- belongs_to:user
- belongs_to:group

###Group
- has_many:users_groups
- has_many:users, through: :users_groups
- has_many:messages
