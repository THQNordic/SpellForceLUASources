-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 181.893356 , 350.414948 , 40.193634 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 181.893356 , 350.414948 , 40.193634 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 181.893356 , 350.414948 , 40.193634 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 181.893356 , 350.414948 , 40.193634 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
