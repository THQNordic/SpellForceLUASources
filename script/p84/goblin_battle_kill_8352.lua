-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 163.717621 , 130.074066 , 9.586195 , 9.199999 , [[Camera:ScriptSplineLookAtPosition(161.478,125.871,10.800);]] )
   Camera:MotionSpline_AddSplinePoint( 163.717621 , 130.074066 , 9.586195 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 163.717621 , 130.074066 , 9.586195 , 9.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 163.717621 , 130.074066 , 9.586195 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
