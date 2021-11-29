-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 562.500916 , 294.785583 , 58.000000 , 19.900040 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 563.500916 , 305.805939 , 58.000000 , 3.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 564.500916 , 316.917999 , 58.000000 , 4.299998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 564.844910 , 323.468811 , 58.000000 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 565.784851 , 337.909607 , 58.000000 , 8.199995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 565.315857 , 349.159393 , 58.000000 , 10.500004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.752930 , 363.222046 , 58.000000 , 11.500008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 556.062866 , 369.065857 , 58.000000 , 12.800013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 554.531982 , 377.269775 , 58.000000 , 13.800016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 560.750793 , 379.735748 , 58.000000 , 15.300022 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 570.205688 , 380.550751 , 58.000000 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 600.459839 , 378.901306 , 62.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
