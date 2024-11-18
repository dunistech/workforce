
# Define a custom filter for role checking
def has_role(user, roles):
    return any(role in [r.type for r in user.roles] for role in roles)


def type(user):
    
    for r in user.roles:
        return r.type.capitalize() or 'student'

    """    
    r = 0
    r =   r in [ r.type for r in user.roles] if r in user.roles else 'student'
    return  r
"""

'''    for r in user.roles:
        #role = r.type if r in user.roles else 'student'
        return r.type if r else 'student'
        #return r.type or 'student'
'''

"""    for r in user.roles:
        return r.type or 'student'"""

"""
<!---- #TEST-CASES
{%for r in current_user.roles%}{{r.type}}{%endfor%}
{{ current_user|type }} 
<!--
{{current_user.roles}} ---
{% for role in current_user.roles %} 
{{
role.id, 
role.type, 
role.created|time_ago
}} 
{% endfor %} --->"""