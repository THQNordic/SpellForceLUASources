-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 379.978790 , 421.984741 , 6.343323 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(319.649,424.398,12.162);]] )
   Camera:MotionSpline_AddSplinePoint( 359.356750 , 419.395874 , 6.343319 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 350.106567 , 415.473999 , 6.453302 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(300.015,410.679,9.740);]] )
   Camera:MotionSpline_AddSplinePoint( 332.024414 , 419.582245 , 7.324123 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 326.071320 , 422.114685 , 7.333319 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 318.798706 , 430.871948 , 6.323318 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(287.028,402.131,10.537);]] )
   Camera:MotionSpline_AddSplinePoint( 308.126740 , 422.480469 , 6.323318 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.03);]] )
   Camera:MotionSpline_AddSplinePoint( 302.082153 , 416.877441 , 6.323318 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(287.513,380.256,16.052);]] )
   Camera:MotionSpline_AddSplinePoint( 290.772369 , 405.684143 , 6.323318 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 280.846771 , 398.900787 , 9.363522 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 274.859558 , 390.404053 , 10.333326 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 277.328979 , 383.571472 , 11.323318 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(319.814,392.606,20.053);]] )
   Camera:MotionSpline_AddSplinePoint( 285.516937 , 376.745117 , 12.324215 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 302.006561 , 368.105957 , 12.353319 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
