---------- Table Enseignant ----------
create table if not exists enseignant (
    code_smartex_ens primary key,
    nom_ens text not null,
    prenom_ens text not null,
    email_ens text not null unique,
    grade_code_ens text not null references grade(code_grade) default 'ex',
    participe_surveillance boolean not null default 0,
);

-- Helpful index for filtering/grouping by grade
create index if not exists idx_enseignant_grade on enseignant(grade_code_ens);

---------- Table Grade ----------
create table if not exists grade (
    code_grade primary key,
    label text not null,
    nb_heure integer not null default 0,
    constraintes grade_code_check check (code_grade in ('pr', 'ma', 'v', 'ptc', 'va', 'ac', 'as', 'ex', 'pes', 'mc'))
);

---------- Table Matieres ----------
create table if not exists matieres (
    code_matiere primary key,
    label text not null,
);