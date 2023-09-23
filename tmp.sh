grep \> evolverMammals.mod.filter.sim.concate.fa | sed 's/>//g' | while read id
do 
  extract_seq_from_fa_database_by_commandline_geneid.pl $id evolverMammals.mod.filter.sim.concate.fa ${id}.wga.fa
  mkdir $id
  mv ${id}.wga.fa $id
  seqkit sliding -w 0 -s 1000 -W 1000 ${id}/${id}.wga.fa > ${id}/${id}.wga.sliding_1kb.fa
  seqkit replace -w 0-p .+ -r "${id}_{nr}" --nr-width 3 ${id}/${id}.wga.sliding_1kb.fa > ${id}/${id}.wga.sliding_1kb.replace.fa
done