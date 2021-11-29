-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.683167 , 131.934311 , 35.183228 , 40.999947 , [[Camera:ScriptSplineLookAtNpc(2757);
Camera:ScriptSplineLookAtApproachingModifier(1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 398.831177 , 150.862411 , 61.796402 , 3.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 406.352112 , 169.046646 , 91.536400 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.109070 , 196.747528 , 102.509583 , 7.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 454.123077 , 197.167130 , 108.256493 , 21.800047 , [[Camera:ScriptSplineLookAtPosition(503.796,196.634,115.330);
Camera:ScriptSplinePause(12);
Camera:ScriptSplineLookAtApproachingModifier(0.15);
]] )
   Camera:MotionSpline_AddSplinePoint( 471.093933 , 166.792923 , 110.329689 , 23.800055 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 494.898376 , 147.490952 , 124.866409 , 26.200064 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 524.410461 , 146.113464 , 149.342758 , 29.000074 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 537.460876 , 190.982697 , 149.689835 , 31.100082 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineLookAtApproachingModifier(0.2);
Camera:ScriptSplineModifyCursorSpeed(2.0);]] )
   Camera:MotionSpline_AddSplinePoint( 500.984100 , 230.469223 , 124.793213 , 32.400078 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 462.238220 , 241.740402 , 110.336693 , 34.700043 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 389.150818 , 215.526184 , 95.186768 , 36.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.834534 , 191.495956 , 82.556694 , 37.599998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.156677 , 169.743820 , 73.276688 , 38.399986 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 319.048920 , 152.491455 , 61.026688 , 39.399971 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 347.823944 , 144.648849 , 43.246689 , 40.899948 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 398.341431 , 133.176880 , 28.986496 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 41.000000 )
   Camera:MotionSpline_SetCorrection( 11.679688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
