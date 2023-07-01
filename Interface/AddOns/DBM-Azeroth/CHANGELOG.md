# <DBM> Azeroth (Classic)

## [1.14.36](https://github.com/DeadlyBossMods/DBM-Classic/tree/1.14.36) (2023-04-11)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Classic/compare/1.14.35...1.14.36) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Classic/releases)

- Prep new tags  
- create new group combat object for cleaner affix features in M+  
- Icons: fix icon target announce (#206) SetIconByTable and SetIconBySortedTable was bumping icon index before firing the returnFunc, causing all icon announces to be shifted by one index.  
- Add gossip show debug to core  
- Update koKR (#205)  
- Update zhTW (#204)  
- Update localization.ru.lua (#203)  
- Fix last, and add to luacheck.  
- Missed an object  
- Add new alert type for incoming debuffs, basically a pre warning for incoming private aura debuffs since the actual warning for those won't be possible. This is basically a pre warning to look out.  
- switch these events back to debug for now  
- bump alpha  
- prep tag for raid testing, shoulda done this earlier, oops  
- Fix a bug where version comms would fail to send FD if voice pack was disabled  
- Fix some occurances of non-localized terms.  
- Give 2 day leway on updates.  
- bump alpha  
- Bump FD  
- Bump toc files  
- Fixed a bug wehre :Restart timer object would fire false debug on count timers because it'd fail to clear previous count timers in the stop call, causing them to do cleanup in start call instead.  
- update instanceDifficulty table for 10.1  
- Update localization.ru.lua (#197)  
- Update localization.ru.lua (#200)  
- Update koKR (#201)  
- Fix last  
- Cleaner solution over the select method before. Closes #199  
- Update koKR (#196)  
- Add option to disable right click on timers.  
- bump alpha  
- prep new tag  
- fix order of operations problem from last commit. can't use DBM global in spec role cause spec role has to load before DBM  
- fully rebuild specrole table on spec changes to resolve issue where the table generated at login is out of date with talent swaps  
- Fixed bug that caused auto gossip not to work by index onn 10.0.5, since code path assumed 10.0.7  
- bump alphas  
- fix versions  
