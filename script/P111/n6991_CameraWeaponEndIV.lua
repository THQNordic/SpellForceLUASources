-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 401.270660 , 65.335686 , 17.961981 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 402.166809 , 64.241638 , 17.961975 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 402.166809 , 64.241638 , 17.961975 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 402.166809 , 64.241638 , 17.961975 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 401.270660 , 65.335686 , 17.961975 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
