class InsertReferenceData < ActiveRecord::Migration
  
  def up
    # Tags
    execute <<-eos
    INSERT INTO tags (name) 
    VALUES
      ('Respiratory'),
      ('TBC'),
      ('Adeno'),
      ('Feces'),
      ('MRSA'),
      ('Ent-Parecho')
    ;
    eos
    
    # Targets
    execute <<-eos
    INSERT INTO targets (id, name)
    VALUES
      (1,'Human Adenovirus'),
      (2,'Bartonella henselae'),
      (3,'Bordetella pertusis'),
      (4,'Bordetella parapertussis'),
      (5,'Clostridium difficile'),
      (6,'Cytomegalovirus'),
      (7,'Enterovirus'),
      (8,'Salmonella enterica'),
      (9,'Shigella spp'),
      (10,'Campylobacter spp'),
      (11,'STEC'),
      (12,'Yersinia enterocolitica'),
      (13,'Influenzavirus A'),
      (14,'Influenzavirus A matrix'),
      (15,'Influenzavirus A H1'),
      (16,'Influenzavirus A N1'),
      (17,'Influenzavirus B'),
      (18,'Phocine distemper virus VIC'),
      (19,'Phocine distemper virus Cy5'),
      (20,'Herpes simplex virus'),
      (21,'Varicella zoster virus'),
      (22,'Herpes simplex virus type 1'),
      (23,'Herpes simplex virus type 2'),
      (24,'Staphylococcus aureus Martineau'),
      (25,'Staphylococcus aureus MecA'),
      (26,'Staphylococcus aureus MecB'),
      (27,'Phocine herpes virus'),
      (28,'Norovirus GGI'),
      (29,'Norovirus GGII'),
      (30,'Parainfluenzavirus 1-4'),
      (31,'Parainfluenzavirus 1'),
      (32,'Parainfluenzavirus 2'),
      (33,'Parainfluenzavirus 3'),
      (34,'Parainfluenzavirus 4'),
      (35,'Cryptosporidium spp'),
      (36,'Cyclospora cayetanensis'),
      (37,'Dientamoeba fragilis'),
      (38,'Entamoeba histolytica'),
      (39,'Giardia lamblia'),
      (40,'Human parechovirus'),
      (41,'Coxiella burnetii'),
      (42,'Legionella spp'),
      (43,'Legionella pneumophila'),
      (44,'Chlamydophila psittaci'),
      (45,'Mycoplasma pneumoniae'),
      (46,'Trichomonas vaginalis'),
      (47,'Neisseria gonorrhoeae'),
      (48,'Chlamydia trachomatis'),
      (49,'Mycoplasma genitalium'),
      (50,'Mycobacterium tuberculosis'),
      (51,'Mycobacterium smegmatis'),
      (52,'Respiratory syncytial virus'),
      (53,'Human Metapneumovirus'),
      (54,'Equine arteritis virus'),
      (55,'Pneumocystis jiroveci'),
      (56,'Carbapenemase')
    ;
    eos
    
    # Assays
    execute <<-eos
    INSERT INTO assays (id, name)
    VALUES
      (1,'PCR Adeno'),
      (2,'PCR Bartonella henselae'),
      (3,'PCR Bordetella pertussis parapertussis'),
      (4,'PCR Clostridium difficile'),
      (5,'PCR CMV'),
      (6,'PCR Enterovirus'),
      (7,'PCR feces'),
      (8,'PCR H1N1 Mexicaanse griep'),
      (9,'PCR Herpes simplex en Varicella zoster'),
      (10,'HSV typering'),
      (11,'PCR Influenza AB'),
      (12,'PCR MRSA screening '),
      (13,'PCR Norovirus'),
      (14,'PCR Parainfluenzavirus type 1-4'),
      (15,'PCR Parasieten'),
      (16,'PCR Parechovirus'),
      (17,'PCR Q-koorts'),
      (18,'PCR PLM'),
      (19,'PCR RSV - hMPV'),
      (20,'PCR SOA1'),
      (21,'PCR SOA2'),
      (22,'PCR TBC'),
      (23,'PCR PJP'),
      (24,'PCR Carbapenase')
    ;    
  eos
  execute <<-eos
    INSERT INTO assay_targets (assay_id, target_id, treshold)
    VALUES
      (1,1,0.1),
      (2,2,0.1),
      (3,3,0.1),
      (4,5,0.1),
      (5,6,0.1),
      (6,7,0.1),
      (7,8,0.1),
      (11,13,0.1),
      (8,14,0.1),
      (9,20,0.1),
      (10,22,0.1),
      (12,24,0.1),
      (13,28,0.1),
      (14,30,0.1),
      (15,35,0.1),
      (16,40,0.1),
      (17,41,0.1),
      (18,42,0.1),
      (20,46,0.1),
      (21,49,0.1),
      (22,50,0.1),
      (19,52,0.1),
      (3,4,0.1),
      (7,9,0.1),
      (11,17,0.1),
      (8,18,0.1),
      (16,18,0.1),
      (14,19,0.1),
      (21,20,0.1),
      (9,21,0.1),
      (10,23,0.1),
      (1,27,0.1),
      (2,27,0.1),
      (4,27,0.1),
      (5,27,0.1),
      (12,27,0.1),
      (17,27,0.1),
      (13,29,0.1),
      (15,38,0.1),
      (18,44,0.1),
      (20,47,0.1),
      (22,51,0.1),
      (6,54,0.1),
      (19,54,0.1),
      (7,10,0.1),
      (11,19,0.1),
      (9,27,0.1),
      (10,27,0.1),
      (21,27,0.1),
      (15,39,0.1),
      (18,45,0.1),
      (20,48,0.1),
      (13,54,0.1),
      (7,27,0.1),
      (15,27,0.1),
      (18,27,0.1),
      (20,27,0.1),
      (7,11,0.1),
      (8,15,0.1),
      (12,25,0.1),
      (15,36,0.1),
      (19,53,0.19),
      (3,27,0.1),
      (7,12,0.1),
      (8,16,0.1),
      (12,26,0.1),
      (15,37,0.1)
    ;
    eos
  end
  
  def down
    execute "DELETE FROM assay"
    execute "DELETE FROM target_taggings;"
    execute "DELETE FROM targets;"
    execute "DELETE FROM tags;"
  end
  
end
