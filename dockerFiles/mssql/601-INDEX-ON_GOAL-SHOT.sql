if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOT')
            and   name  = 'IX_ON_SHOT_ATT_ON_GOAL'
            and   indid > 0
            and   indid < 255)
   drop index SHOT.IX_ON_SHOT_ATT_ON_GOAL
go

CREATE NONCLUSTERED INDEX IX_ON_SHOT_ATT_ON_GOAL ON SHOT (ON_GOAL)