-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.823029 , 128.662079 , 44.183228 , 40.999947 , [[Camera:ScriptSplineLookAtApproachingModifier(1);
Camera:ScriptSplineLookAtPosition(402.442,131.046,31.620);]] )
   Camera:MotionSpline_AddSplinePoint( 392.349335 , 134.108948 , 54.093227 , 1.800000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.025);
Camera:ScriptSplineLookAtPosition(500.637,185.973,116.550);]] )
   Camera:MotionSpline_AddSplinePoint( 404.333649 , 142.014999 , 64.796402 , 3.699999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 412.478333 , 163.901749 , 91.536400 , 5.899997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.109070 , 196.747528 , 102.509583 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 454.123077 , 197.167130 , 108.256493 , 21.300045 , [[Camera:ScriptSplinePause(12);

]] )
   Camera:MotionSpline_AddSplinePoint( 471.093933 , 166.792923 , 110.329689 , 23.600054 , [[Camera:ScriptSplineModifyCursorSpeed(0.8);]] )
   Camera:MotionSpline_AddSplinePoint( 494.898376 , 147.490952 , 124.866409 , 26.300064 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 524.410461 , 146.113464 , 149.342758 , 28.000071 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 537.877319 , 165.231674 , 153.116409 , 29.800077 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineLookAtApproachingModifier(0.0.08);]] )
   Camera:MotionSpline_AddSplinePoint( 537.460876 , 190.982697 , 149.689835 , 32.000084 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineLookAtApproachingModifier(0.2);
Camera:ScriptSplineModifyCursorSpeed(2.0);]] )
   Camera:MotionSpline_AddSplinePoint( 500.984100 , 230.469223 , 124.793213 , 33.200066 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 462.238220 , 241.740402 , 110.336693 , 35.400032 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 389.150818 , 215.526184 , 95.186768 , 37.300003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.834534 , 191.495956 , 82.556694 , 38.099991 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.156677 , 169.743820 , 73.276688 , 38.799980 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 319.048920 , 152.491455 , 61.026688 , 39.699966 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 347.823944 , 144.648849 , 43.246689 , 40.899948 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 389.436890 , 135.474289 , 33.986496 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(401.286,132.107,32.000);
Camera:ScriptSplineLookAtApproachingModifier(1);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 41.000000 )
   Camera:MotionSpline_SetCorrection( 63.554688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
