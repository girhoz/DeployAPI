﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Repositories.Interface
{
    public interface IRepository<T> where T : class
    {
        Task<IEnumerable<T>> Get();
        Task<T> Get(int id);
        Task<T> Post(T entity);
        Task<T> Put(T entity);
        Task<T> Delete(int id);
        T GetByName(string name);
    }
}
