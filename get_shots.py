import pandas as pd
from nba_api.stats.endpoints import shotchartdetail
from nba_api.stats.static import players
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

# 1. DATA EXTRACTION
nba_players = players.get_players()
curry_id = [p for p in nba_players if p['full_name'] == 'Stephen Curry'][0]['id']

# Pulling 2023-24 Season Data
shot_data = shotchartdetail.ShotChartDetail(
    team_id=0, player_id=curry_id, context_measure_simple='FGA',
    season_nullable='2023-24', season_type_all_star='Regular Season'
)

df = shot_data.get_data_frames()[0]
league_avg = shot_data.get_data_frames()[1]

# 2. MACHINE LEARNING (PREDICTION)
df['made_binary'] = df['EVENT_TYPE'].apply(lambda x: 1 if x == 'Made Shot' else 0)
X = df[['LOC_X', 'LOC_Y', 'SHOT_DISTANCE']]
y = df['made_binary']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
model = LogisticRegression()
model.fit(X_train, y_train)

# Calculate and Print Results
accuracy = model.score(X_test, y_test)
print(f"Model Accuracy: {accuracy:.2%}")

# 3. SAVE DATA FOR R
df.to_csv("curry_shots_full.csv", index=False)
league_avg.to_csv("nba_league_avg_2024.csv", index=False)
print("Files saved successfully!")
