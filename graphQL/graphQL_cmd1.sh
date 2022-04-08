# https://medium.com/@mrthankyou/how-to-get-a-graphql-schema-28915025de0e

#---------------
# 1
#---------------
# query AllPeopleWithFriends {
#   allPeople {
#     fullName
#     friends {
#       firstName
#       lastName
#     }
#   }
# }

#---------------
# 2
#---------------
# query AllPeopleWithFriends {
#   allPeople {
#     friends {
#       firstName
#       lastName
#     }
#   }
# }

#---------------
# 3
#---------------
# query AllPeopleWithFriends {
#   allPeople {
#     friends {
#       firstName
#     }
#   }

 
#---------------
# 4
#--------------- 
#   {
#   __schema {
#     queryType {
#       fields {
#         name
#       }
#     }
#   }
# }


#---------------
# 5
#---------------
# {
#   __schema {
#     mutationType {
#       fields {
#         name
#       }
#     }
#   }
# }


#---------------
# 6
#---------------
fragment FullType on __Type {
  kind
  name
  fields(includeDeprecated: true) {
    name
    args {
      ...InputValue
    }
    type {
      ...TypeRef
    }
    isDeprecated
    deprecationReason
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...TypeRef
  }
  enumValues(includeDeprecated: true) {
    name
    isDeprecated
    deprecationReason
  }
  possibleTypes {
    ...TypeRef
  }
}
fragment InputValue on __InputValue {
  name
  type {
    ...TypeRef
  }
  defaultValue
}
fragment TypeRef on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
              }
            }
          }
        }
      }
    }
  }
}


query IntrospectionQuery {
  __schema {
    queryType {
      name
    }
    mutationType {
      name
    }
    types {
      ...FullType
    }
    directives {
      name
      locations
      args {
        ...InputValue
      }
    }
  }
}