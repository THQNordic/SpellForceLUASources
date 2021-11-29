-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 581.709778 , 358.213409 , 89.726402 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(574.860,378.406,60.480);]] )
   Camera:MotionSpline_AddSplinePoint( 564.832031 , 345.553375 , 87.786400 , 11.200006 , [[Camera:ScriptSplineLookAtPosition(557.109,375.800,60.000);
Camera:ScriptSplineLookAtApproachingModifier(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 554.397034 , 335.883118 , 87.286400 , 17.200029 , [[Camera:ScriptSplineLookAtPosition(557.109,375.800,60.000);
Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 543.761414 , 320.230927 , 87.097878 , 24.800058 , [[Camera:ScriptSplineLookAtApproachingModifier(0.05);
Camera:ScriptSplineLookAtPosition(545.298,348.931,59.460);]] )
   Camera:MotionSpline_AddSplinePoint( 531.432739 , 299.505951 , 87.016396 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.05);
Camera:ScriptSplineLookAtPosition(541.609,345.274,59.390);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
