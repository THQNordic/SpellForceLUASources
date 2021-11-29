-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 383.523529 , 449.439911 , 56.201908 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(391.393,430.075,59.318);]] )
   Camera:MotionSpline_AddSplinePoint( 382.523804 , 448.440186 , 56.201908 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.523804 , 448.440186 , 56.201908 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.523804 , 448.440186 , 56.201908 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
