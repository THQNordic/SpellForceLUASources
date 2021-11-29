-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 454.935791 , 402.952667 , 22.747482 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 477.350159 , 422.297150 , 21.697483 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 493.015137 , 434.449005 , 21.747482 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 500.396484 , 450.889740 , 22.477482 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
