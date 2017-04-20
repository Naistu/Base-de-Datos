ejercicio 1:
        a = Film.objects.filter(rating='PG-13').values('title','special_features').all()
        data['query'] = a.query
        data['cols'] = ('Title','Special Features')
        data['rows'] = []
        for b in a:
             data['rows'].append(b)

ejercicio 2:

        a = Film.objects.values_list('length', flat=True).distinct()
        data['query'] = a.query
        data['result'] = a

ejercicio 3:


