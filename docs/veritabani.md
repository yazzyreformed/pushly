# Veritabanı tasarımı (taslak)

PostgreSQL, Entity Framework Core (code-first, migration).

```
Users 1───* PushupSets
Users 1───* ChallengeParticipants *───1 Challenges
Users 1───* UserBadges          *───1 Badges
```

| Tablo | Alanlar | İlişki |
|---|---|---|
| **Users** | Id, Email (benzersiz), PasswordHash, DisplayName, Role (`Admin` / `User`), DailyGoal, CreatedAt | PushupSets, ChallengeParticipants, UserBadges ile bire-çok |
| **PushupSets** | Id, UserId, Reps, DurationSeconds, Source (`Camera` / `Manual`), CreatedAt | Users ile çoğa-bir |
| **Challenges** | Id, Title, Description, TargetReps, StartsAt, EndsAt, CreatedAt | ChallengeParticipants ile bire-çok |
| **ChallengeParticipants** | Id, ChallengeId, UserId, JoinedAt (ChallengeId+UserId benzersiz) | Users ve Challenges ile çoğa-bir |
| **Badges** | Id, Name, Description, RuleType (`TotalReps` / `Streak` / `SingleSet`), Threshold | UserBadges ile bire-çok |
| **UserBadges** | Id, UserId, BadgeId, EarnedAt (UserId+BadgeId benzersiz) | Users ve Badges ile çoğa-bir |

## Hesaplanan değerler (tabloda tutulmaz)

- **Bugünkü şınav:** kullanıcının bugünkü PushupSets toplamı
- **Toplam şınav:** kullanıcının tüm PushupSets toplamı
- **En iyi set:** en yüksek Reps
- **Seri (streak):** günlük hedefin art arda tutturulduğu gün sayısı
- **Challenge ilerlemesi:** katılımcının challenge tarihleri arasındaki şınav toplamı / TargetReps
