package com.iii.movie.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.movie.admin.model.Functiontable;



public interface FunctiontableRepository extends JpaRepository<Functiontable, Long> {

    Functiontable findByName(String name);

    @Override
    void delete(Functiontable functiontable);

}
