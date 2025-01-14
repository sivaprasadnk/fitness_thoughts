import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/data/models/blog_model.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<BlogModel> allBlogs = [
  BlogModel(
    date: DateTime(2025, 1, 5),
    title: "Sleep and Obesity: The Hidden Link You Must Know",
    subTitle:
        'Sleep is often overlooked in the journey to maintaining a healthy weight. However, research consistently shows a strong connection between sleep and obesity. Lack of adequate sleep disrupts hormones that regulate hunger and metabolism, making it harder to maintain a healthy weight. Additionally, poor sleep can lead to increased cravings for high-calorie, unhealthy foods, further complicating weight management efforts.',
    content: '''
Here's how insufficient or poor-quality sleep can impact your weight:

#### 1. **Hormonal Imbalances**

Lack of sleep disrupts the balance of hunger hormones:

- **Leptin**: This hormone signals fullness to your brain. Sleep deprivation lowers leptin levels, making you feel less satisfied after eating.
- **Ghrelin**: Known as the "hunger hormone," ghrelin levels increase with poor sleep, leading to increased appetite and cravings.

#### 2. **Increased Cravings for Unhealthy Foods**

Sleep-deprived individuals often crave high-calorie, sugary, and fatty foods. This is because sleep loss affects the brain's reward system, making unhealthy foods more appealing.

#### 3. **Reduced Energy and Activity Levels**

Poor sleep leads to fatigue, reducing your motivation to exercise or stay active. Lower physical activity means fewer calories burned, contributing to weight gain.

#### 4. **Disrupted Metabolism**

Insufficient sleep affects how your body processes glucose, increasing the risk of insulin resistance and weight gain. Over time, this can contribute to conditions like diabetes and obesity.

#### 5. **Supports Physical Recovery**

Sleep plays a crucial role in repairing and recovering the body. During deep sleep stages, your body works to repair muscles, tissues, and cells damaged during daily activities or workouts. This recovery process helps maintain physical health and improves overall energy levels.

Insufficient sleep affects how your body processes glucose, increasing the risk of insulin resistance and weight gain. Over time, this can contribute to conditions like diabetes and obesity.

### Tips to Break the Cycle

If you're struggling with weight and suspect poor sleep is a factor, consider these tips:

1. **Prioritize Sleep Hygiene**: Maintain a consistent sleep schedule, and create a relaxing bedtime routine.
2. **Manage Stress**: Practice relaxation techniques such as meditation or deep breathing to improve sleep quality.
3. **Limit Late-Night Snacking**: Avoid eating heavy meals or sugary snacks close to bedtime.
4. **Be Physically Active**: Regular exercise promotes better sleep and helps manage weight.
5. **Seek Professional Help**: If sleep issues persist, consult a healthcare provider to address underlying problems like sleep apnea.
''',
    imageAssetPath: 'assets/images/image3.jpg',
    id: 4,
  ),
  BlogModel(
    title: '7 Secrets to Building a Sustainable Fitness Lifestyle',
    subTitle:
        "Adopting a fitness lifestyle goes beyond crash diets or temporary workout routines. It's about building habits that stick and enhance your overall well-being. It requires patience, self-discipline, and a commitment to personal growth.",
    content: '''
Here are seven secrets to crafting a sustainable fitness lifestyle:
1. Set Realistic Goals

Start small and focus on attainable goals. Instead of aiming to lose 10 kg in a month, strive for steady progress like losing 1-2 kg per week. Setting realistic expectations prevents burnout and boosts long-term success.

2. Find Your Motivation

Identify your 'why.' Whether it's improving your health, boosting your energy, or feeling confident, knowing your reason keeps you driven. Write it down and revisit it during tough days.

3. Consistency is Key

Consistency beats intensity over time. Aim for regular workouts and balanced meals rather than sporadic bursts of extreme efforts. Find a schedule that fits your life and stick to it.

4. Make Fitness Enjoyable

Choose activities you love. Whether it's dancing, swimming, cycling, or lifting weights, enjoying the process makes it easier to stay committed. Experiment until you find what lights you up.

5. Fuel Your Body Right

Nutrition is as important as exercise. Focus on whole, nutrient-dense foods. Include lean proteins, healthy fats, and complex carbs in your meals. Stay hydrated and limit processed foods.

6. Prioritize Recovery

Rest days are vital for muscle repair and overall health. Incorporate stretching, foam rolling, and quality sleep into your routine. Listen to your body and avoid overtraining.

7. Track Your Progress

Keep track of your workouts, meals, and milestones. Use apps or journals to monitor your journey. Seeing progress—even small wins—can be incredibly motivating.
''',
    date: DateTime(2025, 01, 04),
    imageAssetPath: 'assets/images/image4.jpg',
    id: 3,
  ),
  BlogModel(
    date: DateTime(2025, 01, 03),
    title: 'Fitness and Life: Finding Balance in Every Step',
    subTitle:
        "Life is a beautiful journey, and fitness is one of its essential companions. While we often think of fitness as just physical activity, it extends far beyond the gym or a workout routine—it's about building strength, resilience, and harmony in every aspect of life.",
    content: '''Why Fitness Matters in Life
### Physical Health: Regular exercise keeps your body strong, improves immunity, and reduces the risk of chronic illnesses.
### Mental Clarity: Fitness activities like yoga or running can significantly reduce stress, enhance focus, and elevate mood.
### Building Discipline: Staying consistent with fitness teaches life skills like time management, dedication, and perseverance.

Integrating Fitness Into Daily Life
### Start Small: Incorporate short walks, stretching, or even bodyweight exercises during breaks.
### Mindful Choices: Take the stairs instead of the elevator or opt for nutrient-rich meals.
### Fitness as a Family Affair: Engage in group activities like hiking, cycling, or sports to bond and stay active together.

Life Lessons From Fitness
### Consistency Beats Perfection: Just like in life, showing up consistently for your workouts builds progress over time.
### Adapt and Overcome: Injuries or plateaus in fitness teach us to adapt, which mirrors how we navigate challenges in life.
### Celebrate Progress: Whether it's lifting heavier weights or finding moments of joy, celebrate every milestone, big or small.

''',
    imageAssetPath: 'assets/images/image2.jpg',
    id: 2,
  ),
  BlogModel(
    title: 'Sleep Smarter: Unlock Peak Health and Performance',
    subTitle:
        "Sleep is more than just rest; it's a vital component of your physical and mental well-being. Quality sleep improves recovery, sharpens focus, and balances your energy for the day ahead. Without it, even the best fitness routines can fall short.",
    content: '''
Sleep is a cornerstone of a healthy lifestyle. Here's why it matters:

1. Supports Recovery: During sleep, your body repairs muscles and tissues, helping you recover from workouts and daily stress.

2. Boosts Mental Health: Adequate sleep improves mood, reduces stress, and enhances cognitive functions like focus and decision-making.

3. Regulates Appetite: Poor sleep can disrupt hunger hormones, leading to overeating and unhealthy food choices.

4. Enhances Performance: Quality sleep boosts energy, stamina, and overall performance in physical activities.

Tips to Improve Sleep Quality

1. Stick to a Consistent Schedule: Going to bed and waking up at the same time every day helps regulate your body's internal clock.

2. Create a Relaxing Bedtime Routine: Engage in calming activities such as reading, meditating, or taking a warm bath before bed.

3. Limit Screen Time: Avoid screens at least an hour before bedtime, as blue light can interfere with your sleep cycle.

4. Optimize Your Sleep Environment: Ensure your bedroom is cool, dark, and quiet for a better sleep experience.

5. Watch Your Diet: Avoid heavy meals, caffeine, and alcohol close to bedtime.
''',
    date: DateTime(2025, 01, 02),
    imageAssetPath: 'assets/images/image2.jpg',
    id: 1,
  ),
];

final allBlogProvider = Provider<List<BlogModel>>((ref) {
  return allBlogs;
});

final recentBlogProvider = FutureProvider((ref) async {
  return await locator<GetRecentPosts>().call();
});
