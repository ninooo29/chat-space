#ChatSpace

##Database creation

##tables

###users
| column | type | unique | index | null |
|:------:|:----:|:------:|:-----:|:----:|
| name | string |        | true  | false |
| email | string | true  |       | false |
| group_id | integer |

###messages
| column | type |
|:------:|:----:|
| body   | text |
| images | string |
| group_id | integer |
| user_id | integer |

###groups
| column | type | unique | null |
|:------:|:----:|:------:|:----:|
| key    | string | true | false |
| user_id | integer |

##association

###User
- belongs_to:group
- has_manys:messages

###Message
- belongs_to:user
- belongs_to:group

###Group
- has_many:users
- has_many:messages
